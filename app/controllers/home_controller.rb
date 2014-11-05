class HomeController < ApplicationController
	before_filter :require_user
  
  def index
  	@directory_semesters = DirectorySemester.all
  end

  def show
  end
end
