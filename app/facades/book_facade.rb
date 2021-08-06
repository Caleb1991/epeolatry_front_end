class BookFacade

  def self.search_for_books(title)
     json = BooksApiServices.get_search_books(title)[:data]

     if !json.nil?
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
   end

  def self.get_single_book(volume_id, user_id, auth_token)
    output = BooksApiServices.get_a_book(volume_id, user_id, auth_token)
    if output != ''
      book = BookPoro.new(
                        id: output[:bookData][:id],
                        title: output[:bookData][:attributes][:title],
                        authors: output[:bookData][:attributes][:authors],
                        description: output[:bookData][:attributes][:description],
                        genres: output[:bookData][:attributes][:genres],
                        shelves: output[:bookData][:attributes][:shelves]
                      )
      words = output[:wordData].map do |word_attributes|
        word_attributes[:attributes][:word]
      end
    else
      book = 'No book found to match this id.'
      words = 'N/A'
    end

    {book: book, words: words}
  end

end
