class DirectoryClassesController < ApplicationController
  before_action :set_directory_class, only: [:show, :edit, :update, :destroy]

  def index
    @directory_classes = DirectoryClass.all
    
  end

  def show
    @directory_class = DirectoryClass.find(params[:id])
    @directory_homeworks = @directory_class.directory_homeworks

    redirect_to directory_homeworks_path(@directory_homeworks)
    
    #respond_to do |format|
    #  format.html #show.html.erb
    #  format.xml { render :xml => @directory_class }
    #end
  end

  def new
    @directory_class = DirectoryClass.new
  end

  def edit

    @directory_class = DirectoryCalss.find(params[:id])

    respond_to do |format|
      format.html #edit.html.erb
      format.xml { render :xml => @directory_class }
    end
  end

  def create
    @directory_class = DirectoryClass.new(directory_class_params)
    respond_to do |format|
      if @directory_class.save
        format.html { redirect_to directory_class_path(@directory_class), notice: 'Directory created'}
      else
        format.html{ render action: "new"}
      end
    end
  end

  def update
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
    @directory_class.destroy
    respond_to do |format|
      if @directory_class.destroy
        format.html { redirect_to directory_classes_path, notices: "Directory destroyed"}
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
