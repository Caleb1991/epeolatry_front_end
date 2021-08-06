class User::DashboardController < ApplicationController
  def show
    @word_stats = UserFacade.my_word_stats(current_user.id)
  end
end
