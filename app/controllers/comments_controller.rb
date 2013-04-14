class CommentsController < ApplicationController

  load_and_authorize_resource
  before_filter :authenticate_user!

  def index
  end

  def show
  end

  def new
  end

  def create
    @project = Project.find(params[:project_id])
    @comment = @project.comments.build(params[:comment])
    @comment.user = current_user

    if @comment.save
      redirect_to @project
    else
      redirect_to @project, alert: "Error adding comment"
    end
  end

  def edit
  end

  def update
  end

  def destroy
  end
end
