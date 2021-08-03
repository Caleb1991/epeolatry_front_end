class UserApiServices
  def self.get_users_books(auth_token, filter = nil)
    response = conn.get('api/v1/user/books') do |req|
      req.params[:filter] = filter
      req.params[:auth_token] = auth_token
    end
    binding.pry
    JSON.parse(response.body, symbolize_names: true)
  end

  def self.add_a_book(volume_id, auth_token, shelf_id = 2)
    response = conn.post "/api/v1/user/books" do |req|
      req.params[:volume_id] = volume_id
      req.params[:auth_token] = auth_token
      req.params[:shelf_id] = shelf_id
    end
    
    response.status
  end

  def self.remove_a_book(volume_id, auth_token, shelf_id)
    response = conn.delete "/api/v1/user/books" do |req|
      req.params[:volume_id] = volume_id
      req.params[:auth_token] = auth_token
      req.params[:shelf_id] = shelf_id
    end
    
    response.status
  end

  def self.add_word_to_glossary(word, volume_id, user_id)
    response = conn.post "/api/v1/user/words" do |req|
      req.params[:word] = word
      req.params[:volume_id] = volume_id
      req.params[:user_id] = user_id
    end
    
    response.status
  end

  private

  def self.conn
    Faraday.new(url: 'https://epeolatry-back-end.herokuapp.com') do |faraday|
    end
  end
end
