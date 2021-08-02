class BooksApiServices
  def self.get_search_books(search)
    Rails.cache.fetch("#{search}_book_search", expires_in: 6.hours) do
      response = conn.get('/api/v1/book/search') do |req|
        req.params[:search] = search
      end
      
      JSON.parse(response.body, symbolize_names: true)
    end
  end

  def self.get_a_book(volume_id)
    response = conn.get('/api/v1/book/search') do |req|
      req.params[:volume_id] = volume_id
    end
    
    JSON.parse(response.body, symbolize_names: true)
  end

  private

  def self.conn
    Faraday.new(url: 'https://epeolatry-back-end.herokuapp.com') do |faraday|
    end
  end
end
