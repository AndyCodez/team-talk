class ProjectsController < ApplicationController
  def new
    @project = Project.new
  end

  def create
    project = Project.new(project_params)

    if project.save
      flash[:success] = "New project created successfully."
      redirect_to root_path
    end 
  end

  def index
  end

  def edit
  end

  def show
  end

  private
  def project_params
    params.require(:project).permit(:name)
  end
end
