class Users::WordsController < ApplicationController
  def index
    @user = User.find_by(params[:uid])
    # @words = @user.words.all
  end

  def show
    if params[:word]
      @word = WordFacade.search(params[:word]).first
    else
      @user = User.find_by(params[:uid])
      @word = user.words.find_by(params[:word])
    end
  end
end
