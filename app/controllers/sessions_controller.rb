class SessionsController < ApplicationController

  def create
    user = User.find_or_create_by(username: auth_hash['info']['email'])
    user.update(user_attributes)
    session[:user_id] = user.id
    # session[:auth_token] = user.access_token
    redirect_to user_dashboard_path(user.id)
  end

  def destroy
    session[:user_id] = nil
    # session[:auth_token] = nil
    redirect_to root_path, message: "You Have Been Logged Out"
  end


  private
  def auth_hash
    request.env['omniauth.auth']
  end

  def user_attributes
    {
    uid: auth_hash['uid'],
    username: auth_hash['info']['email'],
    access_token: auth_hash['credentials']['token']
    }
  end

end
