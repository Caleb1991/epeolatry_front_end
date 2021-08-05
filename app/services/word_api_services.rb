class WordApiServices
  def self.search(word)
    response = Faraday.get("https://epeolatry-back-end.herokuapp.com/api/v1/word/search?q=#{word}")

    JSON.parse(response.body, symbolize_names: true)
  end

  def self.users_words(user_id)
    response = Faraday.get('https://epeolatry-back-end.herokuapp.com/api/v1/user/words') do |req|
      req.params[:user_id] = user_id
      #another placeholder, may become unneccessary
    end

    JSON.parse(response.body, symbolize_names: true)
  end

  def self.get_word_with_books(user_id, word)
    response = Faraday.get("https://epeolatry-back-end.herokuapp.com/api/v1/user/words/#{word}") do |req|
      req.params[:user_id] = user_id
    end
    JSON.parse(response.body, symbolize_names: true)
  end
  
#############TEMPLATES BELOW############

  def self.get_words_for_single_book(user_id, book_id)
    response = Faraday.get('') do |req|
      req.params[:user_id] = user_id
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
