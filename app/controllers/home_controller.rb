class HomeController < ApplicationController

  def index
  	if current_user
  		require_permit
  		@directory_semesters = DirectorySemester.all
  		@projects = Project.where(user_id:current_user.id).all
   	end  	
  end
end
