# 관리자 컨트롤러
class AdminController < ApplicationController
	before_filter :require_admin
  
  # 유저 관리
  def index
  	# DB에 저장된 모든 유저를 출력
  	@users = User.all
  end

  # 유저 사용 승인
  def change_permit
  	if User.permit(params[:user_id])
  	end
  	redirect_to admin_path
  end

end
