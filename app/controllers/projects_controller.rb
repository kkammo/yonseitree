class ProjectsController < ApplicationController
  before_action :set_project, only: [:show, :edit, :update, :destroy]
  before_filter :require_permit

  def index
    load_directory_homework
    @projects = []
    @directory_homework.projects.all.each { |p| @projects << p if p.parent_id.nil? }
  end

  def projectall
    @projects = Project.all
  end

  def project_show
    @project = Project.find(params[:id])
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

  def upper
    @project = Project.find(params[:id])
    if @project.parent_id.nil?
      redirect_to directory_homework_projects_path
    else
      redirect_to branch_directory_homework_project_path(directory_homework_id:@project.directory_homework_id, id:@project.parent_id)
    end
  end
  def branch
    @project = Project.find(params[:id])
    @branches = []
    Project.all.each { |p| @branches << p if p.parent_id == @project.id }
  end

  def commit
    load_directory_homework
    @parent = Project.find(params[:id])
    @project = @directory_homework.projects.new
  end

  def show
    load_directory_homework
    @class = DirectoryClass.find(@directory_homework.directory_class_id)
    @semester = DirectorySemester.find(@class.directory_semester_id)
    @project = Project.find(params[:id])
    @creator = User.find(@project.user_id)

    # @content = CodeRay.scan(File.read('tmp/test.cpp'), :cpp).div
    @content = CodeRay.scan_file('tmp/test.cpp').div

    respond_to do |format|
      format.html
      format.xml { render :xml => @project }
    end
  end

  def upload
    #file_field = @params['form']['file'] rescue nil
    # file_field is a StringIO object
    #file_field.content_type # 'text/csv'
    #file_field.full_original_filename
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
    @project.project_id = params[:project][:parent_id]
    puts current_user
    @project.user_id = current_user.id
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
