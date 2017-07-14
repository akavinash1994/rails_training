class SessionsController < ApplicationController
  def new
  end

  def create
    user = User.find_by(email: session_params[:email].downcase)
    if user && user.authenticate(session_params[:password])
      log_in user
      user.admin? ? (redirect_to users_path) : (redirect_to user_path(user))
    else
      flash[:danger] = 'Invalid email/password combination'
      render 'new'
    end
  end

  def destroy
    log_out
    redirect_to root_url
  end

  private
  def session_params
    params.require(:session).permit(:email, :password)
  end
end
