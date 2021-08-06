require 'rails_helper'

RSpec.describe 'Welcome Page' do
  describe 'As a user' do
    before :each do
      visit root_path
    end

    it 'displays welcome message and description of app' do
      expect(page).to have_content("Epeolatry:")
      expect(page).to have_content("A word & book tracking app")
    end

    it 'displays option to login through Google if user is not logged in' do
      expect(page).to have_link("Login with Google")
      # click_link("Login with Google")
      # expect(current_path).to eq('https://accounts.google.com/o/oauth2/auth/oauthchooseaccount')
    end

    it 'if user is already logged in, shows logout option and no log in' do
      @user_1 = User.create!(username: 'merali4@test.com', access_token: '1234', uid: '1234')
      WelcomeController.any_instance.stub(:current_user).and_return(@user_1)

      visit root_path

      expect(page).to have_content("merali4")
      expect(page).to have_content("Log Out")
      expect(page).to_not have_link('Login with Google')
    end

  end
end
