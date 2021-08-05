class UserFacade

  def self.get_my_books(auth_token)
    json = UserApiServices.get_users_books(auth_token)

    json.map do |book_attributes|
      BookPoro.new(
        id: book_attributes[:id],
        title: book_attributes[:attributes][:title],
        authors: book_attributes[:attributes][:authors],
        description: book_attributes[:attributes][:description],
        genres: book_attributes[:attributes][:genres],
        shelves: book_attributes[:attributes][:shelves]
      )
    end
  end

  def self.add_book_response(book, auth_token, shelf = 2)
    json = UserApiServices.add_a_book(book, auth_token, shelf)

    if json == 204
      'Book Added'
    else
      'Failed to add book'
    end
  end

  def self.remove_book_response(book, auth_token, shelf)
    json = UserApiServices.remove_a_book(book, auth_token, shelf)

    if json == 204
      'Book Removed'
    else
      'Failed to Remove Book'
    end
  end

  def self.create_glossary_response(word, volume_id, user_id)
    json = UserApiServices.add_word_to_glossary(word, volume_id, user_id)

    if json == 201
      'Word added to book!'
    else
      'Failed to add word to book.'
    end
  end
end
