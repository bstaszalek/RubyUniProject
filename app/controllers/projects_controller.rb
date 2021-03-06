class ProjectsController < ApplicationController

  def index
    @projects = current_user.projects.all.paginate(:page => params[:page], :per_page => 5)
  end
  
  def new
    @project = Project.new
  end
  
  def create
    @project = current_user.projects.create(project_params)
 
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
    @tickets = @project.tickets.paginate(:page => params[:page], :per_page => 20)
  end
  
  def update
    @project = Project.find(params[:id])
    if @project.update(project_params)
      redirect_to @project
    else
      render 'edit'
    end
  end
  
  private
  def project_params
    params.require(:project).permit(:title, :description)
  end
end
