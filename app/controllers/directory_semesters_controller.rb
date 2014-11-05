class DirectorySemestersController < ApplicationController
  before_action :set_directory_semester, only: [:show, :edit, :update, :destroy]

  def index
    @directory_semesters = DirectorySemester.all
  end

  def show
    @directory_semester = DirectorySemester.find(params[:id])
  end

  def new
    @directory_semester = DirectorySemester.new
  end

  def edit
    @directory_semester = DirectorySemester.find(params[:id])

    respond_to do |format|
      format.html #edit.html.erb
      format.xml { render :xml => @directory_semester }
    end
  end

  def create
    @directory_semester = DirectorySemester.new(directory_semester_params)
    respond_to do |format|
      if @directory_semester.save
        format.html { redirect_to directory_semester_path(@directory_semester), notice: 'Directory created'}
      else
        format.html{ render action: "new"}
      end
    end
  end

  def update
    @directory_semester.update(directory_semester_params)
    respond_to do |format|
      if @directory_semester.save
        format.html { redirect_to directory_semester_path(@directory_semester), notice: 'Directory updated'}
      else
       format.html { render action: "edit"} 
      end
    end
  end

  def destroy
    @directory_semester.destroy
    respond_to do |format|
      if @directory_semester.destroy
        format.html { redirect_to directory_semesters_path, notices: "Directory destroyed"}
      else
        format.html{ render action: "new"}
      end
    end
  end

  private
    def set_directory_semester
      @directory_semester = DirectorySemester.find(params[:id])
    end

    def directory_semester_params
      params.require(:directory_semester).permit(:semester_name)
    end
end
