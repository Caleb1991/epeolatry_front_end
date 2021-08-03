require 'rails_helper'

RSpec.describe 'word Facade' do
  it 'finds information about a word' do
    VCR.use_cassette 'caterwaul search' do
      word = 'caterwaul'
      result = WordFacade.search(word)[0]

      expect(result.word).to eq('caterwaul')
    end
  end
  describe 'users words' do
    it 'can find all users words' do
      VCR.use_cassette 'users words' do
        user_id = 12
        result = WordFacade.all_users_words(user_id)

        epect(result.word).to eq('sad')
      end

    end
  end
end
