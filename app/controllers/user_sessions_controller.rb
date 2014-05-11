class UserSessionsController < ApplicationController

  def new
  end

  def create

    user_attr = {:role => params[:role]}
    role = Role.find_by(:name=> user_attr[:role])

    if role.blank?
      redirect_to root_url, notice: "Please select a valid role"
      return
    end

    user = User.from_omniauth(env["omniauth.auth"], user_attr || {})

    unless user.has_role? role
      redirect_to root_url, notice: "Not authorized"
      return
    end

    session[:user_id] = user.id
    redirect_to root_url, notice: "Signed in!"
  end

  def destroy
    session[:user_id] = nil
    redirect_to root_url, notice: "Signed out!"
  end

  def failure
    redirect_to signin_path, alert: "Authentication failed, please try again."
  end

end

