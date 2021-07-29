class BooksApiServices
  def get_users_books(user_id)
    response = Faraday.get('heroku_jdgngskjdnfik/bookshelves') do |req|
      req.params['user_id'] = user_id
    end
    #place holders here, may be unneccesary but wanted to have it good to go in the event it is neccessary

    JSON.parse(response.body, symbolize_names: true)
  end

  def self.get_users_books_with_title_filter(user_id, title_params)
    response = Faraday.get('heroku_jdgngskjdnfik/bookshelves') do |req|
      req.params['user_id'] = user_id
      req.params['title_filter'] = title_params
    end
  end
end
