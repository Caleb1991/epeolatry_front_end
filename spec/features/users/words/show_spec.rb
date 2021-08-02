require 'rails_helper'

RSpec.describe 'word show' do
  it 'word show' do
    user1 = User.create!(username: 'test', access_token: 'fake token', uid: '1233')
    VCR.use_cassette 'caterwaul search' do
      visit users_words_path

      fill_in :word, with: "caterwaul"
      click_on "Search"
      expect(current_path).to eq('/users/words/:word')
      expect(page).to have_content('caterwaul')
      expect(page).to have_button('Save Word')
      click_on 'Save Word'
    end

    #visit the uri that leads to form to fill out search
    #fill in with caterwaul
    #click button
    #see caterwauls attributes
    #see button asking if user wants to save word to list
  end
end
