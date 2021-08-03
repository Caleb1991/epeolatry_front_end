require 'rails_helper'

RSpec.describe 'word poro' do
  it 'has attributes' do
    test_word = WordPoro.new(word: 'word', definition: "truth",
      phonetic: 'weird letters', phonetic_link: "https//website.sound_out",
      part_of_speech: 'other noun', synonyms: 'nun', example: 'please pass')

    expect(test_word.word).to eq("word")
    expect(test_word.definition).to eq("truth")
    expect(test_word.phonetic).to eq("weird letters")
    expect(test_word.phonetic_link).to eq("https//website.sound_out")
    expect(test_word.part_of_speech).to eq('other noun')
    expect(test_word.synonyms).to eq('nun')
    expect(test_word.example).to eq('please pass')
  end
end
