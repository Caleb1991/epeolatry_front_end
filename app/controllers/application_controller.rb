class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  add_flash_types :message

  helper_method :current_user

  private

  def current_user
    @current_user ||= User.find(session[:user_id]) if session[:user_id]
  end
end
