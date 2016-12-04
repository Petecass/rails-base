require 'rails_helper'

RSpec.describe Identity, type: :model do
  it 'has a valid factory' do
    expect(build(:identity)).to be_valid
  end

  describe 'ActiveModel validations' do
    subject { build(:identity) }
    it { is_expected.to validate_presence_of(:uid) }
    it { is_expected.to validate_presence_of(:provider) }
    it { is_expected.to validate_uniqueness_of(:uid).scoped_to(:provider) }
  end

  describe 'ActiveRecord associations' do
    subject { build(:identity) }
    it { is_expected.to belong_to(:user) }
  end

  describe 'class methods' do
    context '.find_for_oauth' do
      let(:auth) { double }
      before do
        allow(auth).to receive(:uid).and_return('123')
        allow(auth).to receive(:provider).and_return('facebook')
      end

      context 'when identity exists' do
        let!(:identity) { create(:identity, uid: '123', provider: 'facebook') }
        it 'finds the identity' do
          expect(described_class.find_for_oauth(auth)).to eq identity
        end
      end

      context 'when does not exist' do
        it 'creates an identity' do
          expect {
            described_class.find_for_oauth(auth)
          }.to change {
            Identity.count
          }.by(1)
        end
      end
    end
  end
end
