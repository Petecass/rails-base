require 'rails_helper'

feature 'Facebook sign up' do

  OmniAuth.config.test_mode = true
  let(:user) { User.last }

  before(:each) do
    visit root_path
    click_on 'Signup'
  end

  context 'with valid credentials' do
    context 'when email is present' do
      it 'creates the user' do
        mock_auth_hash
        expect {
          find('#facebookButton').click
        }.to change {
          User.count
        }.by 1

        expect(current_path).to eq root_path
      end
    end

    context 'when email is not present' do
      let(:new_email) { 'chewy@wookie.com' }
      before(:each) do
        mock_auth_hash(email = false)
      end

      it 'creates the user' do
        expect {
          find('#facebookButton').click
        }.to change {
          User.count
        }.by 1
        expect(user.email).to match(/change@me/)
      end

      it 'asks for an email address' do
        find('#facebookButton').click
        expect(current_path).to eq finish_signup_path(user)
        expect(page.body).to have_content('Add Email')

        fill_in 'user_email', with: new_email
        submit

        expect(current_path).to eq root_path
        expect(User.find_by(email: new_email)).to be_present
      end

      context 'after adding an email address' do
        context 'when email address is not unique' do
          let(:new_email) { 'chewy@wookie.com' }
          let(:user) { User.last }

          before(:each) do
            create(:user, email: new_email)
            mock_auth_hash(email = false)
            find('#facebookButton').click
            fill_in 'user_email', with: new_email
            submit
          end

          it 'displays an error' do
            expect(current_path).to eq finish_signup_path(user)
            expect(user.email).to_not eq new_email
          end
        end
      end
    end
  end
end
