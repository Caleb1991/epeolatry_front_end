class WordsApiServices
  def self.get_users_words(user_id)
    response = Faraday.get('') do |req|
      req.params[''] = user_id
      #another placeholder, may become unneccessary
    end

    JSON.parse(response.body, symbolize_names: true)
  end
end
