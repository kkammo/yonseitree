class ProjectsController < ApplicationController
  before_action :set_project, only: [:show, :edit, :update, :destroy]
  before_filter :require_user

  def index
    @projects = Project.all
  end

  def show
    @project = Project.find(params[:id])

    respond_to do |format|
      format.html
      format.xml { render :xml => @project }
    end
  end

  def new
    @project = Project.new
  end

  def edit
    @project = Project.find(params[:id])

    respond_to do |format|
      format.html
      format.xml { render :xml => @project }
    end
  end

  def create
    @project = Project.new(project_params)

    respond_to do |format|
      if @project.save
        format.html { redirect_to project_path(@project), notice: 'Project created'}
      else
        format.html { render action: "new" }
      end
    end
  end

  def update
    @project.update(project_params)
    respond_to do |format|
      if @directory.save
        format.html { redirect_to directory_path(@directory), notice: 'Project edited'}
      else
        format.html { render action: "new" }
      end
    end
  end

  def destroy
    respond_to do |format|
      if @project.destroy
        format.html { redirect_to directories_path, notice: 'Project destroyed'}
      else
        format.html { render action: "new" }
      end
    end
  end

  private
    def set_project
      @project = Project.find(params[:id])
    end

    def project_params
      params.require(:project).permit(:project_name, :description)
    end
end
