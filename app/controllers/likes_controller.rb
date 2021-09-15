class LikesController < ApplicationController
  before_action :set_project
  before_action :find_like, only: [:destroy]

  def create
    if already_liked?
      flash[:notice] = "You can't like more than once"
    else
      @project.likes.create(user_id: current_user.id)
    end

    redirect_to project_path(@project, anchor: 'project_footer')
  end

  def destroy
    if !already_liked?
      flash[:notice] = 'Cannot unlike'
    else
      @like.destroy
    end

    redirect_to project_path(@project, anchor: 'project_footer')
  end

  private

  def set_project
    @project = Project.find_by_id(params[:project_id])
  end

  def already_liked?
    Like.where(user_id: current_user.id, project_id: params[:project_id]).exists?
  end

  def find_like
    @like = @project.likes.find(params[:id])
  end
end
