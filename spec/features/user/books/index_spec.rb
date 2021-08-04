require 'rails_helper'

RSpec.describe 'Books index page' do
  before :each do
    VCR.turn_on!
  end
  it 'shows all of a users books' do
    VCR.turn_off!
    stub_request(:get, "https://epeolatry-back-end.herokuapp.com/api/v1/user/books?auth_token")
    .to_return(status: 200, body: File.open('./spec/fixtures/books_index.json').read, headers: {})

    visit user_books_path

    expect(page).to have_content('Octavia E. Butler')
  end

  xit 'has the title as a link to the given books show page' do
  end

  xit 'shows the author of the books' do
  end

  xit 'shows the genre of the book' do
  end
end
