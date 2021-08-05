require 'rails_helper'
RSpec.describe 'As an authenticated user' do

  describe 'Reader Dashboard' do
    before :each do
      @user = User.create!(username: 'Bob@Boberton.bobmail.com', access_token: 'token', uid: 'thisismyid')
      allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(@user)
      visit user_dashboard_path(@user.uid)
    end

    # it "displays user's e-mail" do
    #   expect(page).to have_content(@user.username)
    # end

    # it 'displays word stats' do
    # end

    xit "displays link to user's book index" do
      expect(page).to have_button("My Beautiful Bevy of Books")
      click_button("My Beautiful Bevy of Books")
      expect(current_path).to eq(user_books_path)
    end

    xit "displays link to user's word index" do
      expect(page).to have_button("My Wordly World of Words")
      click_button("My Wordly World of Words")
      expect(current_path).to eq(user_words_path)
    end

    xit 'displays button to LOG OUT' do
      expect(page).to have_link('Log Out')
      click_link('Log Out')
      expect(current_path).to eq(root_path)
      expect(page).to have_content('You Have Been Logged Out')
      expect(page).to_not have_content('Log Out')
    end

    xit 'does not display option to LOG OUT if user not logged in' do
    end
  end
end
#TODO sad paths?
