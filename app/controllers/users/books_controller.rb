class Users::BooksController < ApplicationController
  def index
    if params.include?('title_filter')
      @books = BookFacade.get_books_with_title_filter(sessions[:user_id], params[:page], params[:title_filter])
      #may want to send a page_number as well. Since there is no book table here, the pagination will be handled via the api, but we'd need to specifiy which page.
    elsif params.include?('author_filter')
      all_books = BookFacade.get_all_books(sessions[:user_id], params[:page])
      @books = all_books.find_all do |book|
        book.author == params[:author_filter]
      end
    elsif params.include?('shelf_filter')
      all_books = BookFacade.get_all_books(sessions[:user_id], params[:page])
      @books = all_books.find_all do |book|
        book.shelf == params[:shelf_filter]
      end
    else
      @books = BookFacade.get_all_books(sessions[:user_id], params[:page])
    end

    #In order to filter, we are thinking we could do one of two things. A ruby find_all with the params passed in,
    #OR we can handle that in the api, since we don't have a books table on this end, my understanding is we can't utilize active record
    #if we go Ruby route, would love to move this to a model, but not having a table here may
    #make it so that we cannot
  end

  def show
    @book = BookFacade.get_single_book(sessions[:user_id], params[:id])
    @words = WordFacade.get_words_for_given_book(sessions[:user_id], params[:id])
  end
end
