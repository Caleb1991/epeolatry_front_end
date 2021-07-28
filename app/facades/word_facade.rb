class WordFacade

  def self.get_all_users_words(user_id)
    json = WordsApiServices.get_users_words(user_id)

    words = json.each do |word_attributes|
      Word.new(word_attributes)
    end
  end

  def self.get_one_user_word(user_id, word_id)
    json = WordsApiServices.get_users_words(user_id)

    word_attributes = json.find do |word_atributes|
      word_attributes[:id] == word_id
    end

    Word.new(word_attributes)
  end
end
