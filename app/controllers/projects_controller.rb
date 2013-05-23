class ProjectsController < ApplicationController

  before_filter :require_user
  before_filter :require_admin, :only => [:index, :new, :create, :edit, :update, :destroy, :show_project_members]

  def index
    @projects = Project.all
  end

  def show
    @project = Project.find(params[:id])
  end

  def new
    @project = Project.new
  end

  def edit
    @project = Project.find(params[:id])
  end

  def create
    @project = Project.new(params[:project])

    respond_to do |format|
      if @project.save
        format.html { redirect_to projects_url, :notice => 'Project was successfully created.' }
      else
        format.html { render :action => "new" }
      end
    end
  end

  def update
    @project = Project.find(params[:id])

    respond_to do |format|
      if @project.update_attributes(params[:project])
        format.html { redirect_to projects_url, :notice => 'Project was successfully updated.' }
      else
        format.html { render :action => "edit" }
      end
    end
  end

  def destroy
    @project = Project.find(params[:id])
    @project.destroy

    respond_to do |format|
      format.html { redirect_to projects_url }
    end
  end

  def show_project_members
    @project = Project.find(params[:id])
    @project_members = @project.user_projects
  end

end
