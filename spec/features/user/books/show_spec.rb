require 'rails_helper'

RSpec.describe 'Book show page' do
  before :each do
    @user = User.create!(username: 'Bob@Boberton.bobmail.com', access_token: 'token', uid: 'thisismyid')
    allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(@user)
    visit user_dashboard_path(@user.id)

    @book_id = 'WxOFiAbwu_cC'
    VCR.turn_off!
  end

  describe 'for a book in the reader\'s library' do
    it 'shows the books key information' do
      mock_return = File.open('./spec/fixtures/book_show_in_lib_no_words_fixture.json')
<<<<<<< HEAD
      stub_request(:get, "https://epeolatry-back-end.herokuapp.com/api/v1/book/show?auth_token=#{@user.access_token}&user_id=#{@user.uid}&book_id=#{@book_id}")
=======
      stub_request(:get, "https://epeolatry-back-end.herokuapp.com/api/v1/user/books/#{@book_id}?auth_token=#{@user.access_token}&user_id=#{@user.id}")
>>>>>>> 30e0effc9f516e90ce239364c519f8bb9c4b2579
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
      stub_request(:get, "https://epeolatry-back-end.herokuapp.com/api/v1/user/books/#{@book_id}?auth_token=#{@user.access_token}&user_id=#{@user.id}")
        .to_return(status: 200, body: mock_return, headers: {})

        visit user_book_path(@book_id)
        expect(page).to have_content("No words looked up yet!")
    end

    it 'shows the words saved for book, where words link to show page' do #DROP FEATURE?  are listed in order of creation
      mock_return = File.open('./spec/fixtures/book_show_in_lib_with_words_fixture.json')
      stub_request(:get, "https://epeolatry-back-end.herokuapp.com/api/v1/user/books/#{@book_id}?auth_token=#{@user.access_token}&user_id=#{@user.id}")
        .to_return(status: 200, body: mock_return, headers: {})

      visit user_book_path(@book_id)

      expect(page).to have_content("Calculus")
      expect(page).to have_content("Transcendental")
      expect(page).to have_content("Photographic")
    end

    it 'has a functional search bar to look up a word for that book' do
      mock_return = File.open('./spec/fixtures/book_show_in_lib_no_words_fixture.json')
      stub_request(:get, "https://epeolatry-back-end.herokuapp.com/api/v1/user/books/#{@book_id}?auth_token=#{@user.access_token}&user_id=#{@user.id}")
        .to_return(status: 200, body: mock_return, headers: {})

      word = 'caterwaul'
      mock_word_return = File.open('./spec/fixtures/word_caterwaul_fixture.json')
      stub_request(:get, "https://epeolatry-back-end.herokuapp.com/api/v1/word/search?q=#{word}")
        .to_return(status: 200, body: mock_word_return, headers: {})

      visit user_book_path(@book_id)
      expect(page).to have_field(:query)

      fill_in :query, with: word
      click_button("Search")

      expect(page).to have_current_path("/user/books/#{@book_id}?word_search=#{word}")
      expect(page).to have_link(word, :href => "/user/books/#{@book_id}/word/#{word}")

      expect(page).to have_field(:query)
      expect(page).to have_content("The Sparrow")
      expect(page).to have_content("Mary Doria Russell")
      expect(page).to have_content("Fiction")
      expect(page).to have_content("A visionary work")
      expect(page).to have_content("To Read")
      expect(page).to have_content("Currently Reading")
    end

    it 'shows the option to remove that book to the reader\'s library' do
      mock_return = File.open('./spec/fixtures/book_show_in_lib_with_words_fixture.json')
      stub_request(:get, "https://epeolatry-back-end.herokuapp.com/api/v1/user/books/#{@book_id}?auth_token=#{@user.access_token}&user_id=#{@user.id}")
        .to_return(status: 200, body: mock_return, headers: {})

      visit user_book_path(@book_id)
      within("##{@book_id}-ToRead") do
        expect(page).to have_button("Remove")
      end
      within("##{@book_id}-CurrentlyReading") do
        expect(page).to have_button("Remove")
      end
    end

    it 'on clicking remove, redirects to book show page' do
      stub_request(:delete, "https://epeolatry-back-end.herokuapp.com/api/v1/user/books/WxOFiAbwu_cC?auth_token=token&shelf_id=2")
        .to_return(status: 204, body: '{}', headers: {})
      stub_request(:delete, "https://epeolatry-back-end.herokuapp.com/api/v1/user/books/WxOFiAbwu_cC?auth_token=token&shelf_id=3")
        .to_return(status: 204, body: '{}', headers: {})

      pre_mock_return = File.open('./spec/fixtures/book_show_in_lib_with_words_fixture.json')
      stub_request(:get, "https://epeolatry-back-end.herokuapp.com/api/v1/user/books/#{@book_id}?auth_token=#{@user.access_token}&user_id=#{@user.id}")
        .to_return(status: 200, body: pre_mock_return, headers: {})
      visit user_book_path(@book_id)

      #Delete from first shelf
      mid_mock_return = File.open('./spec/fixtures/book_show_in_lib_with_words_one_shelf_fixture.json')
      stub_request(:get, "https://epeolatry-back-end.herokuapp.com/api/v1/user/books/#{@book_id}?auth_token=#{@user.access_token}&user_id=#{@user.id}")
        .to_return(status: 200, body: mid_mock_return, headers: {})

      within("##{@book_id}-ToRead") do
        click_button("Remove")
      end

      expect(page).to have_current_path(user_book_path(@book_id))
      expect(page).to_not have_content("To Read")
      expect(page).to have_content("Currently Reading")
      within("##{@book_id}-CurrentlyReading") do
        expect(page).to have_button("Remove")
      end

      #Delete from second shelf
      end_mock_return = File.open('./spec/fixtures/book_show_not_in_lib_fixture.json')
      stub_request(:get, "https://epeolatry-back-end.herokuapp.com/api/v1/user/books/#{@book_id}?auth_token=#{@user.access_token}&user_id=#{@user.id}")
        .to_return(status: 200, body: end_mock_return, headers: {})

      within("##{@book_id}-CurrentlyReading") do
        click_button("Remove")
      end

      expect(page).to have_current_path(user_book_path(@book_id))
      expect(page).to_not have_field(:query)
      expect(page).to have_button("Add 'The Sparrow' to my 'To Read' Shelf")
    end
  end


  describe 'for a book not in the reader\'s library' do
    it 'shows the books key information' do
      mock_return = File.open('./spec/fixtures/book_show_not_in_lib_fixture.json')
      stub_request(:get, "https://epeolatry-back-end.herokuapp.com/api/v1/user/books/#{@book_id}?auth_token=#{@user.access_token}&user_id=#{@user.id}")
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
      stub_request(:get, "https://epeolatry-back-end.herokuapp.com/api/v1/user/books/#{@book_id}?auth_token=#{@user.access_token}&user_id=#{@user.id}")
        .to_return(status: 200, body: mock_return, headers: {})

      visit user_book_path(@book_id)
      expect(page).to have_button("Add 'The Sparrow' to my 'To Read' Shelf")
    end

    it 'upon clicking the add-book button, redirects to book show page with word search bar' do
      stub_request(:post, "https://epeolatry-back-end.herokuapp.com/api/v1/user/books?auth_token=token&shelf_id=2&volume_id=WxOFiAbwu_cC")
        .to_return(status: 204, body: "", headers: {})

      pre_mock_return = File.open('./spec/fixtures/book_show_not_in_lib_fixture.json')
      stub_request(:get, "https://epeolatry-back-end.herokuapp.com/api/v1/user/books/#{@book_id}?auth_token=#{@user.access_token}&user_id=#{@user.id}")
        .to_return(status: 200, body: pre_mock_return, headers: {})

      visit user_book_path(@book_id)

      post_mock_return = File.open('./spec/fixtures/book_show_in_lib_no_words_fixture.json')
      stub_request(:get, "https://epeolatry-back-end.herokuapp.com/api/v1/user/books/#{@book_id}?auth_token=#{@user.access_token}&user_id=#{@user.id}")
        .to_return(status: 200, body: post_mock_return, headers: {})

      click_button("Add 'The Sparrow' to my 'To Read' Shelf")

      expect(page).to have_current_path(user_book_path(@book_id))
      expect(page).to have_content("Current Shelves:")
      expect(page).to have_content("To Read")
      expect(page).to have_content("Your Words for")
      expect(page).to have_content("No words looked up yet!")
      expect(page).to have_field(:query)
    end
  end
end
