require 'rails_helper'

RSpec.describe 'word Facade' do
  xit 'finds information about a word' do
    VCR.use_cassette 'caterwaul search' do
      word = 'caterwaul'
      result = WordFacade.search(word)[0]

      expect(result.word).to eq('caterwaul')
    end
  end
  describe 'users words' do
    xit 'can find all users words' do
      VCR.use_cassette 'users words' do
        user_id = 12
        result = WordFacade.all_users_words(user_id)

        expect(result[0].word).to eq('sad')
      end
    end
  end

  describe 'users words with books' do
    xit 'can find all users words' do
      VCR.use_cassette 'users words books' do
        user_id = 12
        word = 'sad'
        result = WordFacade.get_books_for_given_word(user_id, word)

        expect(result.books).to eq('sad')
      end
    end
  end
end
