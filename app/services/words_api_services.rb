class WordsApiServices
  def self.get_users_words(user_id)
    response = Faraday.get('') do |req|
      req.params[''] = user_id
      #another placeholder, may become unneccessary
    end

    JSON.parse(response.body, symbolize_names: true)
  end

  def self.get_words_for_single_book(user_id, book_id)
    response = Faraday.get('') do |req|
      req.params[''] = user_id
      req.params[''] = book_id
    end

    JSON.parse(response.body, symbolize_names: true)
  end
end
