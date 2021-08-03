require 'rails_helper'

RSpec.describe UserFacade do
  describe 'class methods' do
    describe '.get_my_books' do
      it 'returns book poros of all the users books' do
        VCR.use_cassette 'facade_user_books' do
          actual = UserFacade.get_my_books(auth_token, filter = nil)
        end

        expect(actual.class).to eq(Array)
        expect(actual[0].class).to eq(BookPoro)
      end
    end

    describe '.add_book_response' do
      it 'returns the status code for adding a book' do
        VCR.use_cassette 'add_single_book' do
          actual = UserFacade.add_book_response('B4d1swEACAAJ', auth_token, 2)
        end

        expect(actual).to equal('Book Added')
      end

      it 'returns a fail code if the book is not added' do
        VCR.use_cassette 'add_book_fail' do
          actual = UserFacade.add_book_response('B4d1sdfasdfsadfasdAJ', auth_token, 2)
        end

        expect(actual).to equal('Failed to add Book')
      end
    end

    describe '.remove_book_response' do
      it 'returns the status code for removing a book' do
        VCR.use_cassette 'remove_single_book' do
          actual = UserFacade.remove_book_response('B4d1swEACAAJ', auth_token, 2)
        end

        expect(actual).to equal('Book Removed')
      end

      it 'returns a fail code if the book is not added' do
        VCR.use_cassette 'remove_book_fail' do
          actual = UserFacade.remove_book_response('BasdfasdfasdfsaCAAJ', auth_token, 2)
        end

        expect(actual).to equal('Failed to Remove Book')
      end
    end

    describe '.create_glossary_response' do
      it 'returns the status code for creating a glossary' do
        VCR.use_cassette 'create_good_glossary' do
          actual = UserFacade.create_glossary_response('sad', 'B4d1swEACAAJ', auth_token, 12)
        end

        expect(actual).to equal('Word added to book!')
      end

      it 'returns a fail code if the book is not added' do
        VCR.use_cassette 'create_glossary_fail' do
          actual = UserFacade.create_glossary_response('fldjkjs', 'B4d1swEACAAJ', 12)
        end

        expect(actual).to equal('Failed to add word to book.')
      end
    end
  end
end