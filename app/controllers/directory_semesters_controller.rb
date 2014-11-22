class DirectorySemestersController < ApplicationController
  before_action :set_directory_semester, only: [:show, :edit, :update, :destroy]
  before_filter :require_permit
  
  def index
    @directory_semesters = DirectorySemester.all
    #semesters to show on #index view
  end

  def show
    @directory_semester = DirectorySemester.find(params[:id])
    #find specific semester to show on view
  end

  def new
    @directory_semester = DirectorySemester.new
  end

  def edit
    @directory_semester = DirectorySemester.find(params[:id])

    #find specific semester to edit
    respond_to do |format|
      format.html #edit.html.erb
      format.xml { render :xml => @directory_semester }
    end
  end

  def create
    #create new semester, directory_semester_params contains semester attributes
    @directory_semester = DirectorySemester.new(directory_semester_params)
    respond_to do |format|
      if @directory_semester.save
        format.html { redirect_to root_path, notice: 'Directory created'}
      else
        format.html{ render action: "new"}
      end
    end
  end

  def update

    #update semester with new attributes, directory_semester_params contains semester attributes
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

    #destroy specific semester
    @directory_semester.destroy
    respond_to do |format|
      if @directory_semester.destroy
        format.html { redirect_to root_path, notices: "Directory destroyed"}
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
