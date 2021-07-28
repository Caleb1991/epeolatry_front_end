class BookFacade

  def self.get_all_books(user_id)
    json = BooksApiServices.get_users_books(user_id)

    books = json.each do |book_attributes|
      Book.new(book_attributes)
    end
  end

  def self.get_single_book(user_id, book_id)
    json = BooksApiServices.get_users_books(user_id)

    book_attributes = json.find do |book|
      book[:id] = book_id
    end

    Book.new(book_attributes)
  end
end
