require 'rails_helper'

RSpec.describe User, type: :model do
  it 'has a valid factory' do
    expect(build(:user)).to be_valid
  end

  describe 'ActiveModel validations' do
    subject { build(:identity) }
    # it { is_expected.to validate_presence_of(:uid) }
    # it { is_expected.to validate_presence_of(:provider) }
    # it { is_expected.to validate_uniqueness_of(:uid).scoped_to(:provider) }
  end

  describe 'ActiveRecord associations' do
    subject { build(:user) }
    it { is_expected.to have_many(:identities) }
  end

  describe 'class methods' do
    context '.find_for_oauth' do
      let(:auth) { double }
      before do
        allow(auth).to receive(:uid).and_return('123')
        allow(auth).to receive(:provider).and_return('facebook')
        allow(auth).to receive_message_chain(:info, :email)
        allow(auth).to receive_message_chain(:extra, :raw_info, :name)
      end

      context 'when identity exists' do
        let!(:user) { create(:user) }
        let!(:identity) { create(:identity, uid: '123',
                                            provider: 'facebook',
                                            user: user) }
        it 'finds the user' do
          expect(described_class.find_for_oauth(auth, nil)).to eq user
        end
      end

      context 'when user is present' do
        let!(:user) { create(:user) }
        let!(:identity) { create(:identity, uid: '123',
                                            provider: 'facebook',
                                            user: user) }
        it 'finds the user' do
          expect(described_class.find_for_oauth(auth, user)).to eq user
        end
      end

      context 'when associating another identity' do
        let!(:user) { create(:user) }
        let!(:identity) { create(:identity, uid: '4321',
                                            provider: 'twitter',
                                            user: user) }
        it 'creates the identity' do
          expect {
            described_class.find_for_oauth(auth, user)
          }.to change {
            user.identities.count
          }.by(1)
        end
      end

      context 'when neither user nor identity exist' do
        it 'creates the user' do
          expect {
            described_class.find_for_oauth(auth, nil)
          }.to change {
            User.count
          }.by(1)
        end
      end
    end
  end
end
