class DirectoriesController < ApplicationController
  before_action :set_directory, only: [:show, :edit, :update, :destroy]
  before_filter :require_user

  def index
    @directories = Directory.all
<<<<<<< HEAD
=======

>>>>>>> 01c12b95848a53f8227cafaf91a55e0ac9d1c3d5
  end

  def show
    @directory = Directory.find(params[:id])

    respond_to do |format|
      format.html #show.html.erb
      format.xml { render :xml => @directory }
    end
  end

  def new
    @directory = Directory.new
<<<<<<< HEAD
=======

>>>>>>> 01c12b95848a53f8227cafaf91a55e0ac9d1c3d5
  end

  def edit
  end

  def create
    @directory = Directory.new(directory_params)

    respond_to do |format|
      if @directory.save
        format.html { redirect_to directory_path(@directory), notice: 'Directory created'}
      else
        format.html { render action: "new" }
      end
    end
  end

  def update
    @directory.update(directory_params)
<<<<<<< HEAD
=======

>>>>>>> 01c12b95848a53f8227cafaf91a55e0ac9d1c3d5
  end

  def destroy
    @directory.destroy
<<<<<<< HEAD
=======

>>>>>>> 01c12b95848a53f8227cafaf91a55e0ac9d1c3d5
  end

  private
    def set_directory
      @directory = Directory.find(params[:id])
    end

    def directory_params
      params.require(:directory).permit(:directory_name, :is_terminal)
    end
end
