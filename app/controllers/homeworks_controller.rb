class HomeworksController < ApplicationController
  before_action :set_homework, only: [:show, :edit, :update, :destroy]

  def index
    @homeworks = Homework.all
  end

  def show
    @homework = Homework.find(params[:id])

    redirect_to homework_projects_path(@homework.projects)
  end

  def new
    @homework = Homework.new
    respond_with(@homework)
  end

  def edit
  end

  def create
    @homework = Homework.new(homework_params)
    @homework.save
    respond_with(@homework)
  end

  def update
    @homework.update(homework_params)
    respond_with(@homework)
  end

  def destroy
    @homework.destroy
    respond_with(@homework)
  end

  private
    def set_homework
      @homework = Homework.find(params[:id])
    end

    def homework_params
      params.require(:homework).permit(:name, :subject_id)
    end
end
