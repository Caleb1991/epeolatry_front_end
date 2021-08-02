require 'rails_helper'

RSpec.describe BookPoro do
  it 'has attributes' do
    actual = BookPoro.new(id: '123', 
                          title: 'Forever Green', 
                          authors: ['Alex Green', 'Wanda Grass'], 
                          description: 'A breathtaking book', 
                          genres: ['non-fiction'], 
                          shelves: ['Reading now'])

    expect(actual.id).to eq('123')
    expect(actual.title).to eq('Forever Green')
    expect(actual.authors).to eq(['Alex Green', 'Wanda Grass'])
    expect(actual.summary).to eq('A breathtaking book')
    expect(actual.genres).to eq(['non-fiction'])
    expect(actual.shelves).to eq(['Reading now'])
  end
end