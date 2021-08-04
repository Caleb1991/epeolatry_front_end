class User::BooksController < ApplicationController
  def index
    @books = UserFacade.get_my_books(session[:auth_token])
  end

  def show
    # binding.pry
    user_id = current_user.uid
    auth_token = current_user.access_token
    book_and_words = BookFacade.get_single_book(params[:id], user_id, auth_token)
    @book = book_and_words[:book]
    @words = book_and_words[:words]
  end

  def create
    response = UserFacade.add_book_response(params[:id], sessions[:auth_token])
    flash[:notice] = response
    # redirect
  end

  def destroy
    response = UserFacade.remove_book_response(params[:id], sessions[:auth_token])
    flash[:notice] = response
    # redirect
  end
end
