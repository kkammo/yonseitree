class SemestersController < ApplicationController
  before_action :set_semester, only: [:show, :edit, :update, :destroy]

  def index
    @semesters = Semester.all
  end

  def show
    @semester = Semester.find(params[:id])

    redirect_to semester_subjects_path(@semester.subjects)
  end

  def new
    @semester = Semester.new
    respond_with(@semester)
  end

  def edit
  end

  def create
    @semester = Semester.new(semester_params)
    @semester.save
    respond_with(@semester)
  end

  def update
    @semester.update(semester_params)
    respond_with(@semester)
  end

  def destroy
    @semester.destroy
    respond_with(@semester)
  end

  private
    def set_semester
      @semester = Semester.find(params[:id])
    end

    def semester_params
      params.require(:semester).permit(:name)
    end
end
