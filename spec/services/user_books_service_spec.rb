require 'rails_helper'

RSpec.describe BooksApiServices do
  before :each do
    VCR.turn_on!
  end
  describe 'class methods' do
    describe '.get_users_books' do
      it 'returns all of a users books' do
        VCR.turn_off!
        actual = BooksApiServices.get_users_books

        expect(actual.class).to eq(array)
        expect(actual[0].title).to eq('tim')
      end
    end
    describe '.search_for_books' do
      it 'returns a selection of books from a search' do
        VCR.turn_off!
        actual = BooksApiServices.get_search_books

        expect(actual.class).to eq(array)
        expect(actual[0].title).to eq('tim')
      end
    end
  end
end