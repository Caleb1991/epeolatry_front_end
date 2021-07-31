require 'rails_helper'

RSpec.describe 'word Facade' do
  it 'finds information about a word' do
    VCR.use_cassette 'caterwaul search' do
      word = 'caterwaul'
      result = WordFacade.search(word)[0]

      expect(result.word).to eq('caterwaul')
    end
  end
end
