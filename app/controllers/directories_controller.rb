class DirectoriesController < ApplicationController
  before_action :set_directory, only: [:show, :edit, :update, :destroy]
  before_filter :require_user

  def index
    @directories = Directory.all
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
  end

  def edit
    @directory = Directory.find(params[:id])

    respond_to do |format|
      format.html #show.html.erb
      format.xml { render :xml => @directory }
    end
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
  end

  def destroy
    respond_to do |format|
      if @directory.destroy
        format.html { redirect_to directories_path, notice: 'Directory destroyed'}
      else
        format.html { render action: "new" }
      end
    end
  end

  private
    def set_directory
      @directory = Directory.find(params[:id])
    end

    def directory_params
      params.require(:directory).permit(:directory_name, :directory_type)
    end
end
