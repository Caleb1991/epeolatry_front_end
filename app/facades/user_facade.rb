class UserFacade
  
  def self.get_my_books(auth_token, filter = nil)
    json = UserApiServices.get_users_books(auth_token, filter = nil)

    json.map do |book_attributes|
      BookPoro.new(book_attributes)
    end
  end

  def self.add_book_response(book, auth_token, shelf = 2)
    json = UserApiServices.add_a_book(book, auth_token, shelf)

    if json == 200
      'Book Added'
    else
      'Failed to add book'
    end
  end

  def self.add_book_response(book, auth_token, shelf = 2)
    json = UserApiServices.remove_a_book(book, auth_token, shelf)

    if json == 200
      'Book Removed'
    else
      'Failed to Remove Book'
    end
  end

  def self.create_glossary_response(word, volume_id, user_id)
    json = UserApiServices.add_word_to_glossary(word, volume_id, user_id)

    if json == 200
      'Word added to book!'
    else
      'Failed to add word to book.'
    end
  end
end