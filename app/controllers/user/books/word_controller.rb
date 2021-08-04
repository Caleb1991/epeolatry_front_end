class User::Books::WordController < ApplicationController
  def show # Need to spruce up to work correctly for this route
    if params[:word]
      @word = WordFacade.search(params[:word]).first
    else
      @word = current_user.words.find_by(params[:word])
    end
  end
end
