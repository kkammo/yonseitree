class HomeController < ApplicationController

  def index
  	if current_user.permit
  		require_permit
  		@directory_semesters = DirectorySemester.all
  		@projects = Project.where(user_id:current_user.id).all if Project.all.count > 0
  		@projects = Kaminari.paginate_array(@projects).page(params[:page]).per(5)
   	end  	
  end
end
