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

    it 'displays option to login through Google' do
      expect(page).to have_link("Login with Google")
    end

    it 'displays option to create account' do
      expect(page).to have_link("Create Reader")
    end
  end
end
