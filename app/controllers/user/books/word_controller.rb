class User::Books::WordController < ApplicationController
  def show
    @word = WordFacade.search(params[:word]).first
    @book = BookFacade.get_single_book(params[:book_id], current_user.uid, current_user.access_token)
    # @word_books = WordBookFacade.get_books_for_given_word(current_user.uid, params[:word])
  end

  def new
    UserFacade.create_glossary_response(params[:word], current_user.uid, params[:book_id])
    redirect_to "/user/books/:book_id"
  end

  def search
    response = WordFacade.search(params[:query])
    if response != ''
      @word = response.first
      redirect_to "/user/books/#{params[:book_id]}?word_search=#{@word.word}"
    else
      flash[:error] = "Word not found"
      redirect_to "/user/books/#{params[:book_id]}"
    end
  end
end
