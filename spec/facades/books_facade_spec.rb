require 'rails_helper'

RSpec.describe BookFacade do
  describe 'class methods' do
    describe '.search_for_books' do
      it 'returns book poros based off search word' do
        VCR.use_cassette 'facade_books_search' do
          @actual = BookFacade.search_for_books('Watership')
        end

        expect(@actual.class).to eq(Array)
        expect(@actual[0].class).to eq(BookPoro)
        expect(@actual[0].title).to eq('Tales from Watership Down')
      end
    end

    describe '.get_single_book' do
      xit 'retursn a book based of g_id' do
        VCR.use_cassette 'facade_get_book' do
          @actual = BookFacade.get_single_book('B4d1swEACAAJ')
        end

        expect(@actual.class).to eq(Array)
        expect(@actual[0].class).to eq(BookPoro)
        expect(@actual[0].title).to eq('Watership Down')
      end

      xit 'returns an error if no book is found' do
        VCR.use_cassette 'facade_get_book' do
          @actual = BookFacade.get_single_book('B4asdfasdAAJ')
        end

        expect(@actual).to eq('No book found.')
      end
    end
  end
end
