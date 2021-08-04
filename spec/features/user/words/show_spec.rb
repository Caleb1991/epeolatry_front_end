require 'rails_helper'

RSpec.describe 'word show' do
  xit 'word show' do
    user1 = User.create!(username: 'test', access_token: 'fake token', uid: '1233')
    VCR.use_cassette 'caterwaul search' do
      visit user_words_path

      fill_in :word, with: "caterwaul"
      click_on "Search"
      expect(current_path).to eq('/user/books/word/:word')
      expect(page).to have_content('caterwaul')
      # expect(page).to have_button('Save Word')
      # click_on 'Save Word'
    end

  #this show test asks for a button that only needs to exist if we have a separate button that links the found word to a book manually
  end
end
