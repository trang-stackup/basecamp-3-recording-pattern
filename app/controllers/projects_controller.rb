class ProjectsController < ApplicationController
  def index
    @projects = Current.account.projects.all
  end

  def show
    @project = Current.account.projects.find params[:id]
  end

  def new
    @project = Current.account.projects.new
  end

  def create
    @project = Current.account.projects.new(project_params)

    if @project.save
      redirect_to project_path(@project), notice: "Project created successfully."
    else
      render :new
    end
  end

  private

  def project_params
    params.require(:project).permit(:title)
  end
end
