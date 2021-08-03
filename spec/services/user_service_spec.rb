require 'rails_helper'
z
RSpec.describe UserApiServices do
  before :each do
    VCR.turn_on!
  end
  describe 'class methods' do
    describe '.get_users_books' do
      xit 'returns all of a users books' do
        VCR.use_cassette 'user_books_law' do
          actual = UserApiServices.get_users_books('ya29.a0ARrdaM8WC4useAAdeg3v5qEAX_cVidzPSmmn3cjKhoqv5ugfer1cYPh49P96rgJDhFWarfS_XfD9dBhjzp_BkfRxphOfsPBuFRyTqoZ5klY1tNGUtHLVSiaSagYi5wvIcM6ln64sKZztR3ZHbgp4YVBK1nc5ydh')
        end

        expect(actual.class).to eq(array)
        expect(actual[0].title).to eq('tim')
      end
    end
    
    describe '.add_a_book' do
      xit 'adds a book to a users shelf' do
        VCR.use_cassette 'add_a_book' do
          actual = UserApiServices.add_a_book('B4d1swEACAAJ', 'auth_token')
        end

        expect(actual.status).to eq(200)
      end
    end

    describe '.delete_a_book' do
      xit 'deletes a book to a users shelf' do
        VCR.use_cassette 'remove_a_book' do
          actual = UserApiServices.remove_a_book('B4d1swEACAAJ', 'auth_token', '2')
        end

        expect(actual.status).to eq(200)
      end
    end

    describe '.add_word_to_glossary' do
      xit 'adds a book to a books glossary' do
        VCR.use_cassette 'user_glossary_add' do
          actual = UserApiServices.add_word_to_glossary('sad', 'B4d1swEACAAJ', 12)
        end

        expect(actual.status).to eq(201)
      end
    end
  end
end