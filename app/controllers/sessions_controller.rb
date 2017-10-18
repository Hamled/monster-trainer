class SessionsController < ApplicationController
  def create
    auth_hash = request.env['omniauth.auth']
    if auth_hash.nil? || auth_hash['uid'].nil?
      flash[:error] = "Could not log in"
      return redirect_to root_path
    end

    user = User.find_or_create_by_github(auth_hash)
    if user.nil? || !user.persisted?
      flash[:error] = "Could not log in or create user"
      return redirect_to root_path
    end

    session[:user_id] = user.id
    flash[:success] = "Successfully logged in"
    redirect_to root_path
  end
end
