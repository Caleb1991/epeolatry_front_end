class User::WordsController < ApplicationController
  def index
    #make service call to back end to find users words
    # @words = @user.words.all
  end

  def show # moved to books word_controller

  end
end
