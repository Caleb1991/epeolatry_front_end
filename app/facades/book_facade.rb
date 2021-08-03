class BookFacade

  def self.search_for_books(title)
    json = BooksApiServices.get_search_books(title)[:data]

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

  def self.get_single_book(volume_id)
    json = BooksApiServices.get_a_book(volume_id)[:data]
    
    if json != ''
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
    else
      'No books were found.'
    end
  end
  
end
