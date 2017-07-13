class SessionsController < ApplicationController
  def login
  	@user = User.new
  end
  def login_attempt
  	authorized_user = User.authenticate(params[:user][:email],params[:user][:password])
  	if authorized_user
  		session[:user_id] = authorized_user
  		redirect_to user_path(authorized_user)
  	else
  		render "login"	
  	end  
  end
end
