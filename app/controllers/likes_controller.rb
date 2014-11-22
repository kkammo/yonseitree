class LikesController < ApplicationController
  before_filter :require_permit
  
  # like를 생성한다.
  # form을 통해 따로 받아오는 값이 없으므로 프로젝트와 유저 정보만 저장한다.
  def create
    @project = Project.find(params[:project_id])
    @user = current_user
    @like = Like.create(project_id: @project.id, user_id: @user.id)
   redirect_to :back
  end

  # like를 삭제한다. 즉, 라이크 취소를 누르면 해당 객체가 삭제다.
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

end