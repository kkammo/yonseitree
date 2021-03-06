class ApplicationController < ActionController::Base
  before_action :configure_permitted_parameters, if: :devise_controller?
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  
  before_filter :require_permit, only: [:require_admin]

  # 관리자 여부 확인
  def require_admin
    unless current_user && current_user.role == "admin"
      redirect_to root_path
      flash[:admin_not] = "You are not an admin"
    end        
  end

  # 유저의 로그인 여부 확인
  def require_user
    unless current_user
      redirect_to root_path
      flash[:sign_in] = "로그인이 필요합니다."
    end        
  end

  # 유저의 승인 여부 확인
  def require_permit
    if current_user
      unless current_user.permit
        sign_out current_user
        redirect_to root_path
        flash[:permit_not] = "관리자의 승인 이후 이용 가능합니다."
      end
    else
      redirect_to root_path
      flash[:sign_in] = "로그인이 필요합니다."
    end
  end

  protected
# devise 파라미터
  def configure_permitted_parameters
    devise_parameter_sanitizer.for(:sign_up) { |u| u.permit(:student_id, :role, :user_name, :email, :password, :password_confirmation, :remember_me) }
    devise_parameter_sanitizer.for(:sign_in) { |u| u.permit(:login, :student_id, :email, :password, :remember_me) }
    devise_parameter_sanitizer.for(:account_update) { |u| u.permit(:student_id, :user_name, :email, :password, :password_confirmation, :current_password) }
  end
end
