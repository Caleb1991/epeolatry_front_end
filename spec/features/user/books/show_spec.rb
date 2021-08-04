require 'rails_helper'

# TODO: Add serach bar test + functionality for word search

RSpec.describe 'Book show page' do
  before :each do
    @user = User.create!(username: 'Bob@Boberton.bobmail.com', access_token: 'token', uid: 'thisismyid')
    allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(@user)
    visit user_dashboard_path(@user.uid)

    @book_id = 'WxOFiAbwu_cC'
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

    xit 'has a functional search bar to look up a word for that book' do
      mock_return = File.open('./spec/fixtures/book_show_in_lib_no_words_fixture.json')
      stub_request(:get, "https://epeolatry-back-end.herokuapp.com/api/v1/books/#{@book_id}?auth_token=#{@user.access_token}&user_id=#{@user.uid}")
        .to_return(status: 200, body: mock_return, headers: {})

      expect(page).to have_field("Lookup a word")
    end
  end

  describe 'for a book not in the reader\'s library' do
    it 'shows the books key information' do
      mock_return = File.open('./spec/fixtures/book_show_not_in_lib_fixture.json')
      stub_request(:get, "https://epeolatry-back-end.herokuapp.com/api/v1/books/#{@book_id}?auth_token=#{@user.access_token}&user_id=#{@user.uid}")
        .to_return(status: 200, body: mock_return, headers: {})

      visit user_book_path(@book_id)
      expect(page).to have_content("The Sparrow")
      expect(page).to have_content("Mary Doria Russell")
      expect(page).to have_content("Fiction")
      expect(page).to have_content("A visionary work")
      expect(page).to_not have_content("Current Shelves:")
      expect(page).to_not have_content("Your Words for")
    end

    it 'shows the option to add that book to the reader\'s library' do
      mock_return = File.open('./spec/fixtures/book_show_not_in_lib_fixture.json')
      stub_request(:get, "https://epeolatry-back-end.herokuapp.com/api/v1/books/#{@book_id}?auth_token=#{@user.access_token}&user_id=#{@user.uid}")
        .to_return(status: 200, body: mock_return, headers: {})

      visit user_book_path(@book_id)
      expect(page).to have_button("Add 'The Sparrow' to my 'To Read' Shelf")
    end

    it 'upon clicking the add-book button, redirects to book show page with word search bar' do
      pre_mock_return = File.open('./spec/fixtures/book_show_not_in_lib_fixture.json')
      stub_request(:get, "https://epeolatry-back-end.herokuapp.com/api/v1/books/#{@book_id}?auth_token=#{@user.access_token}&user_id=#{@user.uid}")
        .to_return(status: 200, body: pre_mock_return, headers: {})

      visit user_book_path(@book_id)

      stub_request(:post, "https://epeolatry-back-end.herokuapp.com/api/v1/user/books?auth_token=token&shelf_id=2&volume_id=WxOFiAbwu_cC")
        .to_return(status: 204, body: '{}', headers: {})

      post_mock_return = File.open('./spec/fixtures/book_show_in_lib_no_words_fixture.json')
      stub_request(:get, "https://epeolatry-back-end.herokuapp.com/api/v1/books/#{@book_id}?auth_token=#{@user.access_token}&user_id=#{@user.uid}")
        .to_return(status: 200, body: post_mock_return, headers: {})

      click_button("Add 'The Sparrow' to my 'To Read' Shelf")

      expect(page).to have_current_path(user_book_path(@book_id))
      expect(page).to have_content("Current Shelves:")
      expect(page).to have_content("To Read")
      expect(page).to have_content("Your Words for")
      expect(page).to have_content("No words looked up yet!")
      # expect(page).to have_field("Lookup a word")
    end
  end
end
