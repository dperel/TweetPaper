class SessionsController < ApplicationController
  def create
    @user = User.find_or_create_from_auth_hash(auth_hash)
    session[:user_id] = @user.id
    @articles = Article.where(user_id = current_user.id)
    render 'articles/index'
  end

  protected

  def auth_hash
    request.env['omniauth.auth']
  end
end
