class ProjectsController < ApplicationController
  before_action :authenticate_user!, except: %i[show index]
  before_action :set_project, except: %i[edit update destroy]
  before_action :set_current_user_projects, only: %i[edit update destroy]

  def show
    redirect_to root_path, flash: { alert: "The project #{params[:id]} was not found" } unless @project
  end

  def index
    @projects = Project.all
  end

  def new
    @project = Project.new
  end

  def edit; end

  def create
    @project = Project.new(project_params)

    if @project.save
      flash[:notice] = 'Project was successfully created'
      send_notification_to_followers
      redirect_to project_path(@project)
    else
      flash[:alert] = 'Project was not created'

      render 'new'
    end
  end

  def update
    respond_to do |format|
      if @project.update(project_params)
        format.html { redirect_to @project, notice: 'Project was successfully updated' }
        format.json { render :show, status: :ok, location: @project }
      else
        format.html { render :edit }
        format.json { render json: @project.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @project.destroy
    respond_to do |format|
      format.html { redirect_to root_path, notice: 'Project was succesfully deleted' }
      format.json { head :no_content }
    end
  end

  private

  def set_project
    @project = Project.find_by_id(params[:id])
  end

  def set_current_user_projects
    @project = current_user.projects.find_by_id(params[:id]) or not_found
  end

  def not_found
    redirect_to root_path, alert: 'Not found'
  end

  def send_notification_to_followers
    @project.user.followers.each do |follower|
      ActionCable.server.broadcast("room-#{follower.id}:notification_channel", "#{@project.user.full_name} has published a new project: #{@project.title}! ,#{project_url(@project)}")
    end
  end

  protected

  def project_params
    params.require(:project).permit(:title, :description, :category, :cover_image, :content).merge(user_id: current_user.id)
  end
end
