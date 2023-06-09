class ProjectsController < ApplicationController
  def new
    @project = Project.new
  end

  def create
    project = Project.new(project_params)

    if project.save
      flash[:success] = 'New project created successfully.'
      redirect_to root_path
    else
      render :new
    end
  end

  def index
    @projects = Project.all
  end

  def edit
    @project = Project.find(params[:id])
  end

  def change_status
    @project = Project.find(params[:project_id])

    if @project.update(change_status_params)
      flash[:success] = 'Project status updated successfully.'
      Comment.create(text: "Status changed to '#{@project.status.titleize}' by #{current_user.name}",
                     user_id: current_user.id, project_id: @project.id)
      redirect_to @project
    else
      flash[:warning] = 'Something went wrong. Please try again.'
      redirect_to @project
    end
  end

  def update
    @project = Project.find(params[:id])

    if @project.update(project_params)
      flash[:success] = "Project #{@project.name} updated successfully."
      redirect_to @project
    else
      render :edit
    end
  end

  def show
    @project = Project.find(params[:id])
    @comments = @project.comments
    @comment = Comment.new(project_id: @project.id, user_id: current_user.id)
  end

  def destroy
    project = Project.find(params[:id])
    return unless project.destroy

    flash[:success] = "Project #{project.name} deleted successfully."
    redirect_to root_path
  end

  private

  def project_params
    params.require(:project).permit(:name)
  end

  def change_status_params
    params.require(:project).permit(:status, :project_id)
  end
end
