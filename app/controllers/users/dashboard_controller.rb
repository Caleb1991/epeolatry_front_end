class Users::DashboardController < ApplicationController
  def show
    @user = User.find_by(id: current_user.id)
    @user_email = @user.username
  end
end
