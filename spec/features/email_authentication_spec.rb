# frozen_string_literal: true
require 'rails_helper'

feature 'Email authentication', type: :feature do
  context 'regular sign up path' do
    let(:user_email) { 'chewy@therepublic.com' }
    let(:user_password) { 'password' }

    before do
      visit root_path
      click_link 'Signup'
    end

    context 'with valid credentials' do
      it 'creates a user' do
        fill_in 'user_email', with: user_email
        fill_in 'user_password', with: user_password
        fill_in 'user_password_confirmation', with: user_password
        expect { click_on 'Sign up' }.to change { User.count }.by(1)
      end
    end

    context 'with non matching passwords' do
      it 'displays an error' do
        fill_in 'user_email', with: user_email
        fill_in 'user_password', with: user_password
        fill_in 'user_password_confirmation', with: 'random'
        click_on 'Sign up'

        expect(page.body).to have_css('#error_explanation')
      end
    end

    context 'with an invalid email address' do
      it 'displays an error' do
        fill_in 'user_email', with: 'blah'
        fill_in 'user_password', with: user_password
        fill_in 'user_password_confirmation', with: user_password
        click_on 'Sign up'
        expect(page.body).to have_css('#error_explanation')
      end
    end

    context 'with no password' do
      it 'displays an error' do
        fill_in 'user_email', with: user_email
        fill_in 'user_password', with: nil
        fill_in 'user_password_confirmation', with: nil
        click_on 'Sign up'
        expect(page.body).to have_css('#error_explanation')
      end
    end
  end

  context 'login path' do
    let!(:user) { create(:user) }

    before do
      visit root_path
      click_link 'Login'
    end

    context 'with correct credentials' do
      it 'logs the user in' do
        fill_in 'user_email', with: user.email
        fill_in 'user_password', with: user.password
        click_on 'Log in'
        expect(current_path).to eq root_path
        expect(page.body).to have_content('Logout')
      end
    end

    context 'with invalid credentials' do
      it 'displays an error' do
        fill_in 'user_email', with: user.email
        fill_in 'user_password', with: '123456'
        click_on 'Log in'
        expect(current_path).to eq new_user_session_path
        expect(page.body).to have_content('Invalid Email or password')
      end
    end
  end

  context 'logout' do
    before do
      user = create(:user)
      login_as user
    end

    it 'logs the user out' do
      visit root_path
      expect(page.body).to_not have_content 'Signup'

      click_on 'Logout'
      within('.right.menu') do
        expect(page.body).to have_content 'Signup'
      end
    end
  end
end
