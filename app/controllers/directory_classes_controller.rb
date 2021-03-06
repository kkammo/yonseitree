class DirectoryClassesController < ApplicationController
  before_action :set_directory_class, only: [:show, :edit, :update, :destroy]
  before_filter :require_permit

  def index
    @directory_classes = DirectoryClass.all
    
  end

  def show
    @directory_class = DirectoryClass.find(params[:id])
    @directory_semester = DirectorySemester.find(@directory_class.directory_semester_id)
    #@directory_class is specific class to show on view
    #@directory_semester includes specific @directory_class
  end

  def new
    @directory_class = DirectoryClass.new
  end

  def edit

    @directory_class = DirectoryClass.find(params[:id])

    #@directory_class is specific class to edit
    respond_to do |format|
      format.html #edit.html.erb
      format.xml { render :xml => @directory_class }
    end
  end

  def create
    @directory_semester = DirectorySemester.find(params[:directory_semester_id])
    @directory_class = @directory_semester.directory_classes.create(directory_class_params)

    #directory_class to create
    #directory_class_params contains directory_class attributes
   
    respond_to do |format|
      if @directory_class.save
        format.html { redirect_to directory_semester_path(@directory_semester), notice: 'Directory created'}
      else
        format.html{ render action: "new"}
      end
    end
  end

  def update
    #update directory_class, this function is called after edit
    @directory_class.update(directory_class_params)
    respond_to do |format|
      if @directory_class.save
        format.html { redirect_to directory_class_path(@directory_class), notice: 'Directory updated'}
      else
       format.html { render action: "edit"} 
      end
    end
  end

  def destroy
    #destroy the specific class this function is called after 
    @directory_class.destroy
    respond_to do |format|
      if @directory_class.destroy
        format.html { redirect_to directory_class_path(@directory_class), notices: "Directory destroyed"}
      else
        format.html{ render action: "new"}
      end
    end
  end

  private

    def set_directory_class
      @directory_class = DirectoryClass.find(params[:id])
    end

    def directory_class_params
      params.require(:directory_class).permit(:class_name, :directory_semester_id)
    end
end
