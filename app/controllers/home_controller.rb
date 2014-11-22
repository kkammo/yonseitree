class HomeController < ApplicationController

  def index
  	if current_user
  		if current_user.permit
  			require_permit	
  			@directory_semesters = DirectorySemester.all.order('semester_name ASC')
  			@projects = Project.where(user_id:current_user.id).all if Project.all.count > 0
  			@projects = Kaminari.paginate_array(@projects).page(params[:page]).per(5) unless @projects.nil?
      else
        sign_out current_user
        flash[:permit_not] = "관리자의 승인 이후 이용 가능합니다."
  		end
   	end  	
  end
end
