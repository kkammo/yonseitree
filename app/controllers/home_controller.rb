class HomeController < ApplicationController

  def index
  	if current_user
  		require_permit
  		@directory_semesters = DirectorySemester.all
  	end  	
  end
end
