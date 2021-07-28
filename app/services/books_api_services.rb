class BooksApiServices
  def get_users_books(user_id)
    response = Faraday.get('') do |req|
      req.params[''] = user_id
    end
    #place holders here, may be unneccesary but wanted to have it good to go in the event it is neccessary

    JSON.parse(response.body, symbolize_names: true)
  end
end
