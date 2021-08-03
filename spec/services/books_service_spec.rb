require 'rails_helper'

RSpec.describe BooksApiServices do
  before :each do
    VCR.turn_on!
  end
  describe 'class methods' do
    describe '.search_for_books' do
      it 'returns a selection of books from a search' do
        VCR.use_cassette 'books_search_tim' do
          @actual = BooksApiServices.get_search_books('Tim')
        end

        expect(@actual[:data].class).to eq(Array)
        expect(@actual[:data][0][:attributes][:title]).to eq('The Master Switch')
      end
    end
    describe '.get_a_book' do
      xit 'returns a books from an id' do
        VCR.use_cassette 'book_retrieve_one' do
          @actual = BooksApiServices.get_a_book('B4d1swEACAAJ')
        end

        expect(@actual[:data].class).to eq(Array)
        expect(@actual[:data][0][:title]).to eq('Watership Down')
      end
    end
  end
end
