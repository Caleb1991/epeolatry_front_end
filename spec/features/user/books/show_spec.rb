require 'rails_helper'

RSpec.describe 'Book show page' do
  before :each do
    @user = User.create!(username: 'Bob@Boberton.bobmail.com', access_token: 'token', uid: 'thisismyid')
    allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(@user)
    visit user_dashboard_path(@user.uid)

    @book_id = 'WxOFiAbwu_cC' #god of small things
    VCR.turn_off!
  end

  describe 'for a book in the reader\'s library' do
    it 'shows the books key information' do
      mock_return = File.open('./spec/fixtures/book_show_in_lib_no_words_fixture.json')
      stub_request(:get, "https://epeolatry-back-end.herokuapp.com/api/v1/books/#{@book_id}?auth_token=#{@user.access_token}&user_id=#{@user.uid}")
        .to_return(status: 200, body: mock_return, headers: {})

      visit user_book_path(@book_id)
      expect(page).to have_content("The Sparrow")
      expect(page).to have_content("Mary Doria Russell")
      expect(page).to have_content("Fiction")
      expect(page).to have_content("A visionary work")
      expect(page).to have_content("To Read")
      expect(page).to have_content("Currently Reading")
    end

    it 'if the book has no words associated, shows a note' do
      mock_return = File.open('./spec/fixtures/book_show_in_lib_no_words_fixture.json')
      stub_request(:get, "https://epeolatry-back-end.herokuapp.com/api/v1/books/#{@book_id}?auth_token=#{@user.access_token}&user_id=#{@user.uid}")
        .to_return(status: 200, body: mock_return, headers: {})

        visit user_book_path(@book_id)
        expect(page).to have_content("No words looked up yet!")
    end

    it 'shows the words saved for book, where words link to show page' do #DROP FEATURE?  are listed in order of creation
      mock_return = File.open('./spec/fixtures/book_show_in_lib_with_words_fixture.json')
      stub_request(:get, "https://epeolatry-back-end.herokuapp.com/api/v1/books/#{@book_id}?auth_token=#{@user.access_token}&user_id=#{@user.uid}")
        .to_return(status: 200, body: mock_return, headers: {})

        visit user_book_path(@book_id)
        expect(page).to have_link("Calculus", :href=>"/user/books/#{@book_id}/word/Calculus")
        expect(page).to have_link("Transcendental", :href=>"/user/books/#{@book_id}/word/Transcendental")
        expect(page).to have_link("Photographic", :href=>"/user/books/#{@book_id}/word/Photographic")
    end

    it 'has a search bar to look up a word for that book'
  end

  describe 'for a book not in the reader\'s library' do
    it 'shows the books key information' do
      #title
      #author
      #genres
      #summary
      # NO shelf
    end
    it 'shows the option to add that book to the reader\'s library'
    it 'upon clicking the add-book button, redirects to book show page'
    it 'upon clicking the add-book button, book show includes search bar to look up word'
  end
end
