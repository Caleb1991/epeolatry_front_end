class User::Books::WordController < ApplicationController
  def show # Need to spruce up to work correctly for this route
    if params[:word]
      @word = WordFacade.search(params[:word]).first
    else
      @word = current_user.words.find_by(params[:word])
    end
  end

  def search
    response = WordFacade.search(params[:query])
    if response != ''
      @word = response.first
      redirect_to "/user/books/#{params[:book_id]}?word_search=#{@word.word}"
    else
      flash[:errpr] = "Word not found"
      redirect_to "/user/books/#{params[:book_id]}"
    end
  end
end
