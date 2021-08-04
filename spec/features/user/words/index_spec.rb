require 'rails_helper'

RSpec.describe 'word index' do
  xit 'word look up page' do
    user1 = User.create!(username: 'test', access_token: 'fake token', uid: '1233')
    VCR.use_cassette 'caterwaul search' do
      visit user_words_path

      expect(page).to have_content("Quick Search")
      fill_in :word, with: "caterwaul"
      click_on "Search"
      expect(current_path).to eq('/user/books/word/:word')
      expect(page).to have_content('caterwaul')
    end
  end
end
