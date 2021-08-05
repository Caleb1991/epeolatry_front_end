require 'rails_helper'

RSpec.describe UserApiServices do
  before :each do
    VCR.turn_on!
  end
  describe 'class methods' do
    describe '.get_users_books' do
      it 'returns all of a users books' do
        VCR.use_cassette 'user_books' do
          @actual = UserApiServices.get_users_books('ya29.a0ARrdaM-OoNsLbPmjmD6n36i0152Tkq7xOvrKPR-uyzt-YQfcP-FbWVev3d6yo4Mj6YON4pT5J1YL1N2k35qxcIMxQ8BvSW9dcER2vyPLjKDJbazunOVUMSoZZ9t0wyAp4eg9Zk_JZE2wyG0z1jhxynlGvZajrQ')
        end

        expect(@actual[:data].class).to eq(Array)
        expect(@actual[:data][0][:attributes][:title]).to eq('Breath')
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
