class BookFacade

  def self.search_for_books(title)
    json = BooksApiServices.get_search_books(title)

    json.map do |book_attributes|
      BookPoro.new(book_attributes)
    end
  end

  def self.get_single_book(volume_id)
    json = BooksApiServices.get_a_book(volume_id)

    json.map do |book|
      Book.new(book_attributes)
    end
  end
end
