class UserProjectsController < ApplicationController
  before_filter :require_user
  before_filter :require_admin, :only => [:verify_project_membership]

  def index
    @my_projects = current_user.user_projects
  end

  def new
    @projects = Project.all - current_user.projects
    @user_project = UserProject.new
  end

  def create
    @user_project = UserProject.new(params[:user_project])
    if @user_project.save
      flash[:notice] = "Project successfully added to your profile but admin needs to verify this."
      redirect_to user_projects_url
    else
      @projects = Project.all - current_user.projects
      render :action => "new"
    end
  end

  def edit

  end

  def update

  end

  def show

  end

  def destroy

  end

  def verify_project_membership
    @user_project = UserProject.find(params[:id])
    @user_project.update_attributes(:verified => true)
    flash[:notice] = "User membership has been verified."
    redirect_to show_project_members_url(:id => @user_project.project_id)
  end
end
