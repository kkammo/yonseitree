class DirectoryHomeworksController < ApplicationController
  before_action :set_directory_homework, only: [:show, :edit, :update, :destroy]
  before_filter :require_permit
  
  def index
    @directory_homeworks = DirectoryHomework.all

    #homeworks to show on #index view
  end

  def show
    @directory_homework = DirectoryHomework.find(params[:id])

    #find specific homework to show on view
  end

  def new
    @directory_homework = DirectoryHomework.new
    
  end

  def edit
    @directory_homework = DirectoryHomework.find(params[:id])

    #find specific homework to edit on view
    respond_to do |format|
      format.html #edit.html.erb
      format.xml { render :xml => @directory_homework }
    end
  end

  def create
    #directory_homework to create
    #directory_homework_params contains homework attributes

    @directory_class = DirectoryClass.find(params[:directory_class_id])
    @directory_homework = @directory_class.directory_homeworks.create(directory_homework_params)

    respond_to do |format|
      if @directory_homework.save
        format.html { redirect_to directory_class_path(@directory_class), notice: 'Directory created'}
      else
        format.html{ render action: "new"}  
      end
    end
  end

  def update
    #update edited homework
    
    @directory_homework.update(directory_homework_params)
  end

  def destroy
    #destroy specific homework

    @directory_homework.destroy
    respond_to do |format|
      if @directory_homework.destroy
        format.html { redirect_to directory_homework_path(@directory_homework), notices: "Directory destroyed"}
      else
        format.html{ render action: "new"}
      end
    end
  end

  private
    def set_directory_homework
      @directory_homework = DirectoryHomework.find(params[:id])
    end

    def directory_homework_params
      params.require(:directory_homework).permit(:class_name, :directory_class_id)
    end
end
