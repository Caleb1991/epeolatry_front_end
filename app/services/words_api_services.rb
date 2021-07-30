class WordsApiServices
  def self.get_users_words(user_id, page_number)
    response = Faraday.get('') do |req|
      req.params[''] = user_id
      req.params[''] = page_number
      #another placeholder, may become unneccessary
    end

    JSON.parse(response.body, symbolize_names: true)
  end

  def self.get_words_for_single_book(user_id, book_id, page_number)
    response = Faraday.get('') do |req|
      req.params[''] = user_id
      req.params[''] = book_id
      req.params[''] = page_number
    end

    JSON.parse(response.body, symbolize_names: true)
  end

  def self.get_user_word_stats(user_id)
    response = Faraday.get('') do |req|
      req.params[''] = user_id
    end

    JSON.parse(response.body, symbolize_names: true)
  end
end
