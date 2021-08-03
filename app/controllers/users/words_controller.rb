class Users::WordsController < ApplicationController
  def index
  end

  def create
    response = UserFacade.create_glossary_response(params[:word], params[:book_id], session[:user_id])
    flash[:notice] = response
  end
end
