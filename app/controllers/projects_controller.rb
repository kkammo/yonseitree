class ProjectsController < ApplicationController
  include Transloadit::Rails::ParamsDecoder

  before_action :set_project, only: [:show, :edit, :update, :destroy]
  before_filter :require_permit

  def index
    @homework = DirectoryHomework.find(params[:directory_homework_id])
    @class = DirectoryClass.find(@homework.directory_class_id)
    @semester = DirectorySemester.find(@class.directory_semester_id)
    @projects = @homework.projects.where("project_id IS ?", nil).sort_by{|e| -e.likes.count } #project를 Like수에 따라 정렬하여 보여준다.
    @projects = Kaminari.paginate_array(@projects).page(params[:page]).per(5)
    @users = User.all
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
    @homework = DirectoryHomework.find(@project.directory_homework_id)
    @class = DirectoryClass.find(@homework.directory_class_id)
    @semester = DirectorySemester.find(@class.directory_semester_id)
    @user = User.find(@project.user_id)
    @branches = Project.where(:project_id => @project.id).all.sort_by{ |e| -e.likes.count } #project를 Like수에 따라 정렬하여 보여준다.
    @branches = Kaminari.paginate_array(@branches).page(params[:page]).per(5)
  end

  def commit
    load_directory_homework
    @parent = Project.find(params[:id])
    @file_url = params[:codefile_url]
    @project = @directory_homework.projects.new
  end

  def show
    load_directory_homework

    @class = DirectoryClass.find(@directory_homework.directory_class_id)
    @semester = DirectorySemester.find(@class.directory_semester_id)
    @project = Project.find(params[:id])
    @creator = User.find(@project.user_id)
    @parent = Project.find(@project.parent_id) unless @project.parent_id.nil?
    @content = CodeRay.scan(URI.parse(@project.codefile).read, set_format(@project.codefile)).div

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
    @project = @directory_homework.projects.new

    @file_url = params[:codefile_url]

  end

  def edit
    load_directory_homework
    @project = @directory_homework.projects.find(params[:id])
    #@project = Project.find(params[:id])
    @parent = @project.parent_id.nil? ? @directory_homework : Project.find(@project.parent_id)
    @file_url = @project.codefile
    respond_to do |format|
      format.html
      format.xml { render :xml => @project }
    end
  end

  def create
    load_directory_homework

    @project = @directory_homework.projects.new(project_params)
    @project.project_id = params[:project][:parent_id]
    @project.user_id = current_user.id
    @project.user_name = current_user.user_name

    respond_to do |format|
      if @project.save
        format.html { redirect_to [@directory_homework, @project], notice: 'Project created'}
      else
        format.html { render action: "new" }
      end
    end
  end

  def update
    load_directory_homework
    @project.update(project_params)
      if @project.save
        redirect_to directory_homework_project_path(@directory_homework, @project)
      else
        format.html { render action: "edit"}
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
      @search = String.new(params[:search])
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
      params.require(:project).permit(:project_name, :description, :codefile)
    end

    def set_format(url)
      format = url.split(/.*\./)[1]
      if format == "rb"
        format = "ruby"
      elsif format == "py"
        format = "python"
      elsif format == "js"
        format = "javascript"
      end
      format
    end
end
