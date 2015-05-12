class ProjectsController < ApplicationController
  def new
  end
  
  def create
    @project = Project.new(project_params)
 
    @project.save
    redirect_to @project
  end
  
  private
  def project_params
    params.require(:project).permit(:title, :description)
  end
end
