class Users::BooksController < ApplicationController
  def index
    @books = BookFacade.get_all_books(session[:user_id], session[:auth_token], params[:filter])
  end

  def show
    @book = BookFacade.get_single_book(sessions[:user_id], params[:id])
    @words = WordFacade.get_words_for_given_book(sessions[:user_id], params[:id])
  end
end
