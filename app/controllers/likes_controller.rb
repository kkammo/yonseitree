class LikesController < ApplicationController

  def create
    @project = Project.find(params[:project_id])
    @user = current_user
    @like = Like.create(project_id: @project.id, user_id: @user.id)
   redirect_to project_path(@project)
  end

  def destroy


    Like.find(params[project_id: @project.id, user_id: @user.id]).destroy

    redirect_to project_path(@project)
  end
 
  def new
    @like = Like.new()
  end

  def findlike
    Like.find(parmas[:project_id, :user_id])
  end
private
    def like_params
      params.require(:like)
    end

end
