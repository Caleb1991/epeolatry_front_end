class User::Books::WordController < ApplicationController
  def show
    @word = WordFacade.search(params[:word]).first
    # @book = BookFacade.get_single_book(params[:book_id])
    @book = BookPoro.new(title: 'Title', id: params[:book_id])
  end

  def new
    UserFacade.create_glossary_response(params[:word], current_user.uid, params[:book_id])
    redirect_to "/user/books/:book_id"
  end
end
