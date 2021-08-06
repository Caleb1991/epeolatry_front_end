class User::WordsController < ApplicationController
  def index
    @words = WordFacade.all_users_words(current_user.id)
  end

  def show # moved to books word_controller
    # @word = WordFacade.
  end
end
