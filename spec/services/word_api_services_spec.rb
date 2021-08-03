require 'rails_helper'

RSpec.describe 'back_end word_api_service' do
  it 'can get info' do
    VCR.use_cassette 'caterwaul search' do

    result = WordApiServices.search('caterwaul')
    expect(result[:data][:id]).to eq('caterwaul')
    end
  end
  describe 'books words' do
    it 'can get a users books saved words' do
      VCR.use_cassette 'users words' do

      result = WordApiServices.users_words(12)
      expect(result.count).to eq(1)
      end
    end
  end
end
