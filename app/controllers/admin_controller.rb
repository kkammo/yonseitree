class AdminController < ApplicationController
	before_filter :require_admin
  
  def index
  	@users = User.all
  end

  def change_permit
  	if User.permit(params[:user_id])
  	end
  	redirect_to admin_path
  end

end
