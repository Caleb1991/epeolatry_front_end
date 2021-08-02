class Users::WordsController < ApplicationController
  def index
    @user = User.find_by(params[:uid])
    @words = @user.words.all
  end

  def show
    @word = WordFacade.search(params[:word])
  end
end
