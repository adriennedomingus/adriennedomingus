class ProjectsController < ApplicationController
  def show
    @project = Project.find_by(slug: params[:slug])
  end

  def index
    @projects = Project.all
  end
end
