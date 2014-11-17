class SubjectsController < ApplicationController
  before_action :set_subject, only: [:show, :edit, :update, :destroy]

  def index
    @subjects = Subject.all
  end

  def show
    @subject = Subject.find(params[:id])

    redirect_to subject_homeworks_path(@subject.homeworks)
  end

  def new
    @subject = Subject.new
    respond_with(@subject)
  end

  def edit
  end

  def create
    @subject = Subject.new(subject_params)
    @subject.save
    respond_with(@subject)
  end

  def update
    @subject.update(subject_params)
    respond_with(@subject)
  end

  def destroy
    @subject.destroy
    respond_with(@subject)
  end

  private
    def set_subject
      @subject = Subject.find(params[:id])
    end

    def subject_params
      params.require(:subject).permit(:name, :semester_id)
    end
end
