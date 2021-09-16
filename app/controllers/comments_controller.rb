class CommentsController < ApplicationController
  def create
    @comment = current_user.comments.new(comment_params)

    flash[:alert] = @comment.errors.full_messages.to_sentence unless @comment.save

    redirect_to project_path(params[:project_id], anchor: 'comments_card')
  end

  def destroy
    @comment = current_user.comments.find(params[:id])

    @comment.destroy
    flash[:notice] = 'Deleted comment'

    redirect_to project_path(params[:project_id], anchor: 'comments_card')
  end

  private

  def comment_params
    params
      .require(:comment)
      .permit(:content)
      .merge(project_id: params[:project_id])
  end
end
