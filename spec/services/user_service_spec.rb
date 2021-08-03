require 'rails_helper'

RSpec.describe UserApiServices do
  before :each do
    VCR.turn_on!
  end
  describe 'class methods' do
    describe '.get_users_books' do
      it 'returns all of a users books' do
        VCR.use_cassette 'user_books' do
          @actual = UserApiServices.get_users_books('ya29.a0ARrdaM-vu2sw0V27N15VulFkM9EH0AciH_l9TeZan0Zw8wVezLWaW81KHj_Y4Y8tdCZP2m0crX6spLCbxbS1gyyQ4qkQ7BI_bg4U1lAiMkvzZoUQxjwPuVV6uCMxa37sqCBT0EndhXWvjFKedg76jD4oifl58A')
        end

        expect(@actual[:data].class).to eq(Array)
        expect(@actual[:data][0][:attributes][:title]).to eq('The Three-Body Problem')
      end
    end
  end
  
  describe '.add_a_book' do
    it 'adds a book to a users shelf' do
      VCR.use_cassette 'add_a_book' do
        @actual = UserApiServices.add_a_book('B4d1swEACAAJ', 'ya29.a0ARrdaM8awP7ia9xOT7kBRYtvt-6SguYe-bnj6nbugUrwaRA_-mpiqI4MOWLfOL0OLVj6R--3UmXyM8ml6HBwtr1F9kH99HaV4ACIp9mOc74Hj2A8d2aJ8-Qytx3nrd39Ny6_v-0jZVgFu5daon7SwmY6kGvWHw')
      end
      
      expect(@actual).to eq(204)
    end
  end

  describe '.delete_a_book' do
    it 'deletes a book to a users shelf' do
      VCR.use_cassette 'remove_a_book' do
        @actual = UserApiServices.remove_a_book('B4d1swEACAAJ', 'ya29.a0ARrdaM8awP7ia9xOT7kBRYtvt-6SguYe-bnj6nbugUrwaRA_-mpiqI4MOWLfOL0OLVj6R--3UmXyM8ml6HBwtr1F9kH99HaV4ACIp9mOc74Hj2A8d2aJ8-Qytx3nrd39Ny6_v-0jZVgFu5daon7SwmY6kGvWHw', '2')
      end
      
      expect(@actual).to eq(204)
    end
  
    describe '.add_word_to_glossary' do
      it 'adds a book to a books glossary' do
        VCR.use_cassette 'user_glossary_add' do
          @actual = UserApiServices.add_word_to_glossary('sad', 'B4d1swEACAAJ', 12)
        end

        expect(@actual).to eq(201)
      end
    end
  end
end
