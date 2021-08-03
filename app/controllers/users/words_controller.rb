class Users::WordsController < ApplicationController
  def index
    #make service call to back end to find users words
    # @words = @user.words.all
  end

  def show
    if params[:word]
      @word = WordFacade.search(params[:word]).first #why is that like that?
    else
      @word = current_user.words.find_by(params[:word])
    end
  end

  def create
    response = UserFacade.create_glossary_response(params[:word], params[:book_id], session[:user_id])
    flash[:notice] = response
  end
end
