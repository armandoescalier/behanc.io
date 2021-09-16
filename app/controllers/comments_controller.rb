class CommentsController < AuthorizationsController
  before_action :set_comment

  def create
    @comment = current_user.comments.new(comment_params)

    if @comment.save
      flash[:notice] = 'Comment created'
    else
      flash[:alert] = 'Comment cannot be created'
    end

    redirect_to project_path(params[:project_id])
  end

  def destroy
    if @comment.present?
      if @comment.destroy
        flash[:notice] = 'Comment deleted'
      else
        flash[:alert] = 'Comment cannot be deleted'
      end
    else
      flash[:alert] = 'Comment not found'
    end

    redirect_to project_path(params[:project_id])
  end

  private

  def set_comment
    @comment = current_user.comments.find_by_id(params[:id])
  end

  def comment_params
    params
      .require(:comment)
      .permit(:content)
      .merge(project_id: params[:project_id])
  end
end
