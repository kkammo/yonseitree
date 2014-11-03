class DirectoriesController < ApplicationController
  before_action :set_directory, only: [:show, :edit, :update, :destroy]
  before_filter :require_user

#checking!!!
  def index
    @directories = Directory.all
#    respond_with(@directories)
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
    #respond_with(@directory)
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
    #respond_with(@directory)
  end

  def destroy
    @directory.destroy
    #respond_with(@directory)
  end

  private
    def set_directory
      @directory = Directory.find(params[:id])
    end

    def directory_params
      params.require(:directory).permit(:directory_name, :is_terminal)
    end
end
