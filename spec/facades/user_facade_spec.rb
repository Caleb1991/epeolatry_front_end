require 'rails_helper'

RSpec.describe UserFacade do
  describe 'class methods' do
    describe '.get_my_books' do
      xit 'returns book poros of all the users books' do
        VCR.use_cassette 'facade_user_books' do
          @actual = UserFacade.get_my_books("ya29.a0ARrdaM-vu2sw0V27N15VulFkM9EH0AciH_l9TeZan0Zw8wVezLWaW81KHj_Y4Y8tdCZP2m0crX6spLCbxbS1gyyQ4qkQ7BI_bg4U1lAiMkvzZoUQxjwPuVV6uCMxa37sqCBT0EndhXWvjFKedg76jD4oifl58A")
        end

        expect(@actual.class).to eq(Array)
        expect(@actual[0].class).to eq(BookPoro)
      end
    end

    describe '.add_book_response' do
      it 'returns the status code for adding a book' do
        VCR.use_cassette 'facade_add_a_book' do
          @actual = UserFacade.add_book_response('B4d1swEACAAJ', 'ya29.a0ARrdaM-vu2sw0V27N15VulFkM9EH0AciH_l9TeZan0Zw8wVezLWaW81KHj_Y4Y8tdCZP2m0crX6spLCbxbS1gyyQ4qkQ7BI_bg4U1lAiMkvzZoUQxjwPuVV6uCMxa37sqCBT0EndhXWvjFKedg76jD4oifl58A', 2)
        end

        expect(@actual).to eq('Book Added')
      end

      xit 'returns a fail code if the book is not added' do
        VCR.use_cassette 'facade_add_book_fail' do
          @actual = UserFacade.add_book_response('B4d1sdfasdfsadfasdAJ', 'ya29.a0ARrdaM-vu2sw0V27N15VulFkM9EH0AciH_l9TeZan0Zw8wVezLWaW81KHj_Y4Y8tdCZP2m0crX6spLCbxbS1gyyQ4qkQ7BI_bg4U1lAiMkvzZoUQxjwPuVV6uCMxa37sqCBT0EndhXWvjFKedg76jD4oifl58A', 2)
        end

        expect(@actual).to eq('Failed to add Book')
      end
    end

    describe '.remove_book_response' do
      it 'returns the status code for removing a book' do
        VCR.use_cassette 'facade_remove_single_book' do
          @actual = UserFacade.remove_book_response('B4d1swEACAAJ', 'ya29.a0ARrdaM-vu2sw0V27N15VulFkM9EH0AciH_l9TeZan0Zw8wVezLWaW81KHj_Y4Y8tdCZP2m0crX6spLCbxbS1gyyQ4qkQ7BI_bg4U1lAiMkvzZoUQxjwPuVV6uCMxa37sqCBT0EndhXWvjFKedg76jD4oifl58A', 2)
        end

        expect(@actual).to eq('Book Removed')

      end

      xit 'returns a fail code if the book is not added' do
        VCR.use_cassette 'facade_remove_book_fail' do
          @actual = UserFacade.remove_book_response('BasdfasdfasdfsaCAAJ', 'ya29.a0ARrdaM-vu2sw0V27N15VulFkM9EH0AciH_l9TeZan0Zw8wVezLWaW81KHj_Y4Y8tdCZP2m0crX6spLCbxbS1gyyQ4qkQ7BI_bg4U1lAiMkvzZoUQxjwPuVV6uCMxa37sqCBT0EndhXWvjFKedg76jD4oifl58A', 2)
        end

        expect(@actual).to eq('Failed to Remove Book')
      end
    end

    describe '.create_glossary_response' do
      it 'returns the status code for creating a glossary' do
        VCR.use_cassette 'facade_create_good_glossary' do
          @actual = UserFacade.create_glossary_response('sad', 'B4d1swEACAAJ', 12)
        end

        expect(@actual).to eq('Word added to book!')
      end

      xit 'returns a fail code if the book is not added' do
        VCR.use_cassette 'facade_create_glossary_fail' do
          @actual = UserFacade.create_glossary_response('fldjkjs', 'B4d1swEACAAJ', 12)
        end

        expect(@actual).to eq('Failed to add word to book.')
      end
    end
  end
end
