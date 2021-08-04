require 'rails_helper'

RSpec.describe 'word index' do
  before :each do
    user_1 = User.create!(
      username: 'test@gmail.com', 
      access_token: 'fake token', 
      uid: '1233'
    )
  end
  describe 'visiting the page' do
    it 'shows all of a users words' do
      stub_request(current_user)
          .to_return(user_1)
      visit user_words_path

      expect(page).to have_content(user_1.username)

    end
  end
end

# xit 'word look up page' do
#   user1 = User.create!(username: 'test', access_token: 'fake token', uid: '1233')
#   VCR.use_cassette 'caterwaul search' do
#     visit user_words_path

#     expect(page).to have_content("Quick Search")
#     fill_in :word, with: "caterwaul"
#     click_on "Search"
#     expect(current_path).to eq('/user/books/word/:word')
#     expect(page).to have_content('caterwaul')
#   end
# end