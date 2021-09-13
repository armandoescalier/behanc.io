class HomeController < ApplicationController
  before_action :set_project

  def index; end

  def set_project
    @project = Project.all
  end
end
