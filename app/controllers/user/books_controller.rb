class User::BooksController < ApplicationController
  def index
    # if !params[:search].nil?
      # @pagy, @books = pagy_array(UserFacade.get_my_books(params[:auth_token]))
      # @searched_books = BookFacade.search_for_books(params[:search])
    # else
    #   @pagy, @books = pagy_array(UserFacade.get_my_books(session[:auth_token]))
    # end
    @books = UserFacade.get_my_books(current_user.access_token)
  end

  def show
    user_id = current_user.uid
    auth_token = current_user.access_token
    book_and_words = BookFacade.get_single_book(params[:id], user_id, auth_token)
    @book = book_and_words[:book]
    @words = book_and_words[:words]
    @searched_word = params[:word_search]
  end

  def create
    response = UserFacade.add_book_response(params[:id], current_user.access_token)
    flash[:notice] = response
    redirect_to user_book_path(params[:id])
  end

  def destroy
    shelf = ApplicationHelper.shelf_name_to_id(params[:shelf])
    book_id = params[:id]
    auth_token = current_user.access_token

    response = UserFacade.remove_book_response(book_id, auth_token, shelf)
    flash[:notice] = response
    redirect_to user_book_path(params[:id])
  end
end
