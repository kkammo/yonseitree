class CommentsController < ApplicationController

  def create
    @project = Project.find(params[:project_id])
    @user = current_user
    @comment = @post.comments.create(params[:comment])
    redirect_to post_path(@post)
  end

end
