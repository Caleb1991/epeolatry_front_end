class Word
  attr_reader :word,
              :definition,
              :pronunciation,
              :part_of_speech,
              :example,
              :synonyms,
              :language

  def initialize(json)
      @word = json
      @definition = json
      @pronunciation = json
      @part_of_speech = json
      @example = json
      @synonyms = json
      @language = json
  end
end