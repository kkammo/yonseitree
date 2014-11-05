class DirectoryHomeworksController < ApplicationController
  before_action :set_directory_homework, only: [:show, :edit, :update, :destroy]

  def index
    @directory_homeworks = DirectoryHomework.all
  end

  def show
    @directory_homework = DirectoryHomework.find(params[:id])

   # @projects = @directory_homework.projects
   # redirect_to projects_path(@projects)
    #directory_homework_path(@directory_homework)
    #respond_with(@directory_homework)
  end

  def new
    @directory_homework = DirectoryHomework.new
    #respond_with(@directory_homework)
  end

  def edit
    @directory_homework = DirectoryHomework.find(params[:id])

    respond_to do |format|
      format.html #edit.html.erb
      format.xml { render :xml => @directory_homework }
    end
  end

  def create

    @directory_class = DirectoryClass.find(params[:directory_class_id])
    @directory_homework = @directory_class.directory_homeworks.create(directory_homework_params)
    #@directory_class = DirectoryClass.new(directory_class_params)
    respond_to do |format|
      if @directory_homework.save
        format.html { redirect_to directory_class_path(@directory_class), notice: 'Directory created'}
      else
        format.html{ render action: "new"}  
      end
    end
  end

  def update
    @directory_homework.update(directory_homework_params)
    #respond_with(@directory_homework)
  end

  def destroy
    @directory_homework.destroy
    respond_to do |format|
      if @directory_homework.destroy
        format.html { redirect_to directory_homework_path(@directory_homework), notices: "Directory destroyed"}
      else
        format.html{ render action: "new"}
      end
    end
    #respond_with(@directory_homework)
  end

  private
    def set_directory_homework
      @directory_homework = DirectoryHomework.find(params[:id])
    end

    def directory_homework_params
      params.require(:directory_homework).permit(:class_name, :directory_class_id)
    end
end
