class CommentsController < ApplicationController
  before_filter :require_permit

  # comment를 생성한다.
  # 코멘트는 작성자(User)의 id, 해당 프로젝트의 (id)를 갖는다.
  # form 에서 받아온 코멘트의 body를 permit 메쏘드를 이용해 받아온다.
  def create
    @project = Project.find(params[:project_id])
    @user = current_user
    @comment = @project.comments.create(body: comment_params[:body], user_id: current_user.id, commenter: current_user.user_name)
    redirect_to :back
  end

  #댓글을 삭제한다.
  #해당 프로젝트에서 코멘트 아이디를 이용하여 찾고 삭제한다.
  def destroy
    @project = Project.find(params[:project_id])
    @comment = @project.comments.find(params[:id])
    @comment.destroy
    redirect_to :back
  end

private
    def comment_params

      params.require(:comment).permit(:body)
    end
end