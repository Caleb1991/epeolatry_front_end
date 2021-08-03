class WordFacade
  def self.search(word)
    attributes = WordApiServices.search(word)
    attributes.map do |attribute|
      WordPoro.new(attribute[1][:attributes])
    end
  end
#the above and below methods work almost identically. I, Alex, left the two diff syntax for educational purposes.

  def self.all_users_words(user_id)
    attributes = WordApiServices.users_words(user_id)[:data]
    attributes.map do |attributes|
      WordPoro.new(attributes[:attributes])
    end[0]
  end

  def self.one_user_word(user_id, word_id)
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
