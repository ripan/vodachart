class UserSessionsController < ApplicationController
 def new
 end

 def create
  user_attr = {:role_id => params[:role_id]}
  user = User.from_omniauth(env["omniauth.auth"], user_attr || {})
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
