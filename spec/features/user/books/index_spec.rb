require 'rails_helper'

RSpec.describe 'Books index page' do
  before :each do
    VCR.turn_off!
    stub_request(:get, "https://epeolatry-back-end.herokuapp.com/api/v1/user/books?auth_token")
    .to_return(status: 200, body: File.open('./spec/fixtures/books_index.json').read, headers: {})
  end

  it 'shows all of a users books and the books are links to the books show page' do
    visit user_books_path

    expect(page).to have_link("Lilith's Brood")
    expect(page).to have_link("The Three-Body Problem")
    expect(page).to have_link("Parable of the Sower")
    expect(page).to have_link("All You Need Is Kill")
    expect(page).to have_link("Snow Crash")
  end

  it 'shows the author of the books' do
    visit user_books_path

    expect(page).to have_content("Author:")
  end

  it 'shows the genre of the book' do
    visit user_books_path

    expect(page).to have_content("Genre:")
  end

  xit 'has a search bar' do
    mock_book_return = File.open('./spec/fixtures/book_search_kin_of_ata_fixture.json')

    visit user_books_path

    current_path("https://epeolatry-back-end.herokuapp.com/api/v1/book/search?query=#{'The Giver'}")
  end
end
