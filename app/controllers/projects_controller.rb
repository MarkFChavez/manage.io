class ProjectsController < ApplicationController

  load_and_authorize_resource
  before_filter :authenticate_user!
  
  def index
    @projects = Project.all
  end

  def show
    @project = Project.find(params[:id])
    @comments = @project.comments.limit(5)
    @comment = Comment.new
  end

  def new
    @project = Project.new
  end

  def create
    @project = current_user.projects.build(params[:project])

    if @project.save
      redirect_to new_project_path, notice: "Project created successfully. View <a href='#'>here</a>"
    else
      render :new
    end
  end

  def edit
    @project = Project.find(params[:id])
  end

  def update
    @project = Project.find(params[:id])

    if @project.update_attributes(params[:project])
      redirect_to edit_project_path(@project), notice: "Project updated successfully!"
    else
      render :edit
    end
  end

  def destroy
    @project = Project.find(params[:id])
    @project.destroy

    redirect_to user_projects_path(current_user), alert: "Project deleted successfully!"
  end

end
