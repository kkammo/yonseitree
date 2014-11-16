class ProjectsController < ApplicationController
  before_action :set_project, only: [:show, :edit, :update, :destroy]
  before_filter :require_permit

  def index
    load_directory_homework
    @projects = @directory_homework.projects.all
  end

  def projectall
    @projects = Project.all
  end

  def project_show
    @project = Project.find(params[:project_id])
    @content = CodeRay.scan_file('tmp/test.cpp').div
  end

  def project_destroy
    @project = Project.find(params[:project_id])
    @project.destroy

    redirect_to projectall_projects_path
  end

  def project_edit
    @project = Project.find(params[:project_id])
  end

  #all of above function is for without directory homework version...

  def show
    load_directory_homework
    @project = @directory_homework.projects.find(params[:id])

    # @content = CodeRay.scan(File.read('tmp/test.cpp'), :cpp).div
    @content = CodeRay.scan_file('tmp/test.cpp').div

    respond_to do |format|
      format.html
      format.xml { render :xml => @project }
    end
  end

  def new
    load_directory_homework
    #@project = Project.new
    @project = @directory_homework.projects.new
  end

  def edit
    load_directory_homework
    @project = @directory_homework.projects.find(params[:id])
    #@project = Project.find(params[:id])

    respond_to do |format|
      format.html
      format.xml { render :xml => @project }
    end
  end

  def create
    #@project = Project.new(project_params)
    load_directory_homework

    @project = @directory_homework.projects.new(project_params)

    respond_to do |format|
      if @project.save
        format.html { redirect_to [@directory_homework, @project], notice: 'Project created'}
      else
        format.html { render action: "new" }
      end
    end
  end

  def update
    @project.update(project_params)

    
      #if @project.save
      #  format.html { redirect_to directory_homework_projects_path(@directory_homework), notice: 'Project edited'}
      #else
      #  format.html { render action: "new" }

      if @directory_homework #if it is in directory_homework
        redirect_to directory_homework_projects_path(@directory_homework)
      else
        redirect_to project_project_show_path(@project)
      
    end
  end

  def destroy
    load_directory_homework
    respond_to do |format|
      if @project.destroy
        format.html { redirect_to directory_homework_projects_path(@directory_homework), notice: 'Project destroyed'}
      else
        format.html { render action: "new" }
      end
    end
  end

  def search
    if params[:search].length > 0
      @projects = Project.search(params[:search])
    else
      @projects = nil
    end 
  end

  private
    def load_directory_homework
      @directory_homework = DirectoryHomework.find(params[:directory_homework_id])
    end

    def set_project
      @project = Project.find(params[:id])
    end

    def project_params
      params.require(:project).permit(:project_name, :description)
    end
end
