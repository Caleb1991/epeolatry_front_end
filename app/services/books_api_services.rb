class BooksApiServices
  def self.get_search_books(search)
    Rails.cache.fetch("#{search}_book_search", expires_in: 6.hours) do
      response = conn.get('/api/v1/book/search') do |req|
        req.params[:search] = search
      end
      parse_json(response)
    end
  end

  def self.get_a_book(volume_id, user_id, auth_token)
    #will need to confirm endpoint for single book lookup
    Rails.cache.fetch("#{volume_id}_information", expires_in: 18.hours) do
      response = conn.get("/api/v1/user/books/#{volume_id}")  do |req|
        req.params[:user_id] = user_id
        req.params[:auth_token] = auth_token
      end
    end
    parse_json(response)
  end

  def self.parse_json(response)
    JSON.parse(response.body, symbolize_names: true)
  end

  private

  def self.conn
    Faraday.new(url: 'https://epeolatry-back-end.herokuapp.com') do |faraday|
    end
  end
end
