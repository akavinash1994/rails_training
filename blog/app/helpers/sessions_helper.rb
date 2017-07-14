module SessionsHelper
  def log_in(user)
    session[:user_id] = user.id
  end

  def current_user
    @current_user ||= User.find_by(id: session[:user_id])
  end

  def logged_in?
   current_user.present?
  end
  def log_out
    session.delete(:user_id)
    @current_user = nil
  end

  def admin_user?
    redirect_to user_path(current_user) unless current_user.admin?    
  end
  
  def redirect_not_logged_in
    redirect_to root_path unless logged_in?
  end

end
