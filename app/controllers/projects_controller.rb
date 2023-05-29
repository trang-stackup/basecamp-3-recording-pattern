class ProjectsController < ApplicationController
  def index
    # @projects = Current.account.projects.all
    @projects = Project.where(id: Current.account.buckets.pluck(:bucketable_id))
  end

  def show
    # @project = Current.account.projects.find params[:id]
    @project = Current.account.buckets.find_by(bucketable_id: params[:id])&.bucketable
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
