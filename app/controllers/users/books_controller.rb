class Users::BooksController < ApplicationController
  def index
    @books = UserFacade.get_my_books(session[:auth_token], params[:filter])
  end

  def show
    @book = BookFacade.get_single_book(params[:id])
    # @words = WordFacade.get_words_for_given_book(sessions[:user_id], params[:id])
  end

  def create
    response = UserFacade.add_book_response(params[:id], sessions[:auth_token])
    flash[:notice] = response
  end

  def destroy
    response = UserFacade.remove_book_response(params[:id], sessions[:auth_token])
    flash[:notice] = response
  end
end
