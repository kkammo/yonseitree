class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  def require_admin
    unless current_user && current_user.admin == true
      redirect_to root_path
      # flash[:error] = "You are not an admin"
      flash[:notice] = "You are not an admin"
    end        
  end

  def require_user
    unless current_user
      redirect_to root_path
      flash[:sign_in] = "로그인이 필요합니다."
    end        
  end
end
