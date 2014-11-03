class ProjectsController < ApplicationController
  before_action :set_project, only: [:show, :edit, :update, :destroy]
  before_filter :require_user

  def index
    @projects = Project.all
  end

  def show
  end

  def new
    @project = Project.new
  end

  def edit
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
  end

  def destroy
    @project.destroy
  end

  private
    def set_project
      @project = Project.find(params[:id])
    end

    def project_params
      params.require(:project).permit(:project_name, :description)
    end
end
