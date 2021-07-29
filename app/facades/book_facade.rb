class BookFacade

  def self.get_all_books(user_id)
    json = BooksApiServices.get_users_books(user_id)

    books = json.each do |book_attributes|
      Book.new(book_attributes)
    end
    #feel this may be a good start, but right now with too much unknown as to the json response, this may need retooling
  end

  def self.get_single_book(user_id, book_id)
    json = BooksApiServices.get_users_books(user_id)

    book_attributes = json.find do |book|
      book[:id] = book_id
    end

    Book.new(book_attributes)
    #for right now this seems the easiest way to do this, but we could send something else over
  end

  def self.get_books_with_title_filter(user_id, title_params)
    json = BooksApiServices.get_users_books_with_title_filter(user_id, title_params)

    books = json.each do |book_attributes|
      Book.new(book_attributes)
    end
  end
end
