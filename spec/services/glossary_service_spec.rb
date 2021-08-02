require 'rails_helper'
z
RSpec.describe GlossaryApiServices do
  before :each do
    VCR.turn_on!
  end
  describe 'class methods' do
    describe '.add_word_to_glossary' do
      xit 'adds a book to a books glossary' do
        VCR.use_cassette 'user_glossary_add' do
          actual = GlossaryApiServices.add_word_to_glossary()
        end

        expect(actual.class).to eq(array)
        expect(actual[0].title).to eq('tim')
      end
    end
  end
end