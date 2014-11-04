class HomeController < ApplicationController
  def index
  	@directory_semesters = DirectorySemester.all
  end

  def show
  end
end
