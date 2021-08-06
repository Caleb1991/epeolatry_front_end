require 'rails_helper'
RSpec.describe 'As an authenticated user' do

  describe 'Reader Dashboard' do
    before :each do
      @user = User.create!(username: 'Bob@Boberton.bobmail.com', access_token: 'token', uid: 12)
      allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(@user)
        visit user_dashboard_path(@user.uid)
    end
      describe 'links' do

        # it "displays user's e-mail" do
        #   expect(page).to have_content(@user.username)
        # end

        # it 'displays word stats' do
        # end

        it "displays link to user's book index" do
          expect(page).to have_button("My Beautiful Bevy of Books")
          click_button("My Beautiful Bevy of Books")
          expect(current_path).to eq(user_books_path)
        end

        it "displays link to user's word index" do
          expect(page).to have_button("My Wordly World of Words")
          click_button("My Wordly World of Words")
          expect(current_path).to eq(user_words_path)
        end

        it 'displays button to LOG OUT' do
          expect(page).to have_link('Log Out')
          click_link('Log Out')
          expect(current_path).to eq(root_path)
          expect(page).to have_content('You Have Been Logged Out')
          expect(page).to_not have_content('Log Out')
        end

        xit 'does not display option to LOG OUT if user not logged in' do
        end
      end

      describe 'word stats' do
        it 'displays average words saved per book' do
          expect(page).to have_content("Your Word Stats")
          #add section
          expect(page).to have_content("Average Saved per Book: #{@word_stats[:avg_per_book]}")
          expect(page).to have_content("Most Frequent Look Up: #{@word_stats[:most_frequent]}")
          expect(page).to have_content("Longest Word Searched: #{@word_stats[:longest_word]}")
        end
      end
  end
end
#TODO sad paths?
