class ProjectsController < ApplicationController
  
  def index
    @projects = current_user.projects
  end
  
  def new
    @project = Project.new
  end
  
  def create
    @project = Project.new(project_params)
 
    if @project.save
      redirect_to @project
    else
      render 'new'
    end
  end
  
  def edit
    @project = Project.find(params[:id])
  end
  
  def destroy
    @project = Project.find(params[:id])
    @project.destroy

    redirect_to projects_path
  end
  
  def show
    @project = Project.find(params[:id])
  end
  
  private
  def project_params
    params.require(:project).permit(:title, :description)
  end
end
