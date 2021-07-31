require 'rails_helper'

RSpec.describe 'back_end word_api_service' do
  it 'can get info' do
    VCR.use_cassette 'caterwaul search' do

      result = WordServices.search('caterwaul')

      expect(result[:data][:id]).to eq('caterwaul')
    end
  end
end




# get 'https://epeolatry-back-end.herokuapp.com/words/search' do
