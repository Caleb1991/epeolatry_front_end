class WordFacade

  def self.search(word)
    attributes = WordServices.search(word)
    attributes.map do |attribute|
      test = WordPoro.new(attribute[1][:attributes])
    end
  end

  def self.get_all_users_words(user_id)
    json = WordsApiServices.get_users_words(user_id)

    words = json.map do |word_attributes|
      Word.new(word_attributes)
    end
    #same as books, hoping this is a good start, but may need retooling
    #perhaps to work around the last method we can send over the joins in this package
  end

  def self.get_one_user_word(user_id, word_id)
    json = WordsApiServices.get_users_words(user_id)

    word_attributes = json.find do |word_atributes|
      word_attributes[:id] == word_id
    end

    Word.new(word_attributes)
    #also same as books, hoping this template is helpful
  end

  def self.get_words_for_given_book(user_id, book_id)
    json = WordsApiServices.get_words_for_single_book(user_id, book_id)

    words = json.map do |word_attribute|
      Word.new(word_attribute)
    end
    #not having tables here, to our understanding we will need to pull in another endpoint that sends over the joins
  end
end
