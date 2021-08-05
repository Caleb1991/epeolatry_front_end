require 'rails_helper'

RSpec.describe 'users books words' do
  before :each do
    VCR.turn_on!
  end
  xit 'unsaved word show' do
    user1 = User.create!(username: 'test', access_token: 'fake token', uid: '1233')
    VCR.use_cassette 'book word search' do
      word = 'caterwaul'
      book_id = 'B4d1swEACAAJ'
      visit  "/user/books/#{book_id}/word/#{word}"

      expect(page).to have_content('caterwaul')
      expect(page).to have_button('Save to Book')
      expect(page).to have_button('Back to Book')
    end
  end

  xit 'save unsaved word' do
    user1 = User.create!(username: 'test', access_token: 'fake token', uid: '1233')
    User::Books::WordController.any_instance.stub(:current_user).and_return(user1)
    VCR.use_cassette 'new word glossary add' do
      word = 'caterwaul'
      book_id = 'B4d1swEACAAJ'

      visit  "/user/books/#{book_id}/word/#{word}"

      expect(page).to have_button('Save to Book')
      click_on('Save to Book')
      expect(current_path).to eq("/user/books/#{book_id}")
      expect(page).to have_content('caterwaul')
      # expect(page).to have_content("#{word.books}")
    end
  end

  xit 'dont save word' do
    user1 = User.create!(username: 'test', access_token: 'fake token', uid: '1233')
    User::Books::WordController.any_instance.stub(:current_user).and_return(user1)
    VCR.use_cassette 'new word glossary dont add' do
      word = 'caterwaul'
      book_id = 'B4d1swEACAAJ'

      visit  "/user/books/#{book_id}/word/#{word}"

      expect(page).to have_button('Back to Book')
      click_on('Back to Book')
      expect(current_path).to eq("/user/books/#{book_id}")
      expect(page).to_not have_content('caterwaul')
    end
  end
end
