class LikesController < ApplicationController
  before_filter :require_permit
  
  def create
    @project = Project.find(params[:project_id])
    @user = current_user
    @like = Like.create(project_id: @project.id, user_id: @user.id)
   redirect_to :back
  end



  def destroy
    @project = Project.find(params[:project_id])
    @user = current_user
    Like.find_by(project_id: @project.id, user_id: @user.id).destroy
    redirect_to :back
  end

 
  def new
    @like = Like.new()
  end

private
    def like_params
      params.require(:like)
    end

    def load_directory_homework
      @directory_homework = DirectoryHomework.find(params[:directory_homework_id])
    end


end
