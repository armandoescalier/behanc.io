class CommentsController < ApplicationController
  def create
    @comment = current_user.comments.new(comment_params)

    if @comment
      @comment.save
      flash[:notice] = 'Comment created'
    else
      flash[:alert] = 'Comment cannot be created'
    end

    redirect_to project_path(params[:project_id])
  end

  def destroy
    @comment = current_user.comments.find(params[:id])

    if @comment
      @comment.destroy
      flash[:notice] = 'Comment deleted'
    else
      flash[:alert] = 'Comment cannot be deleted'
    end

    redirect_to project_path(params[:project_id])
  end

  private

  def comment_params
    params
      .require(:comment)
      .permit(:content)
      .merge(project_id: params[:project_id])
  end
end
