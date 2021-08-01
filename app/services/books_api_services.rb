class BooksApiServices
  def self.get_users_books(filter = nil)
    response = conn.get('api/v1/user/books') do |req|
      req.params[:filter] = filter
    end
    #place holders here, may be unneccesary but wanted to have it good to go in the event it is neccessary
    binding.pry
    JSON.parse(response.body, symbolize_names: true)
  end

  def self.get_search_books(filter = nil)
    response = Faraday.get('/api/v1/book/search') do |req|
      req.params[:filter] = filter
    end
    #place holders here, may be unneccesary but wanted to have it good to go in the event it is neccessary

    JSON.parse(response.body, symbolize_names: true)
  end

  def self.add_book(volume_id)
    conn.put "/user/books"
      req.params[:book] = volume_id
  end

  private

  def self.conn
    Faraday.new(url: 'https://epeolatry-back-end.herokuapp.com') do |faraday|
      faraday.params[:auth_token] = 'ya29.a0ARrdaM8WC4AAdeg3v5qEAX_cVidzPSmmn3cjKhoqv5ugfer1cYPh49P96rgJDhFWarfS_XfD9dBhjzp_BkfRxphOfsPBuFRyTqoZ5klY1tNGUtHLVSiaSagYi5wvIcM6ln64sKZztR3ZHbgp4YVBK1nc5ydh'
      # faraday.params[:user_id] = session[:user_id]
    end
  end
end
