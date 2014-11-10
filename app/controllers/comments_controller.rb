class CommentsController < ApplicationController

  def create
    @project = Project.find(params[:project_id])
    @user = current_user
   @comment = @project.comments.create(comment_params)
   redirect_to project_path(@project)
  end

  def destroy
    @project = Project.find(params[:project_id])
    @comment = @project.comments.find(params[:id])
    @comment.destroy
    redirect_to project_path(@project)
  end

private
    def comment_params
      params.require(:comment).permit(:commenter, :body)
    end

end
