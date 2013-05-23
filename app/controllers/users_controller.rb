class UsersController < ApplicationController
  before_filter :require_user, :except => [:new,:create]
  before_filter :require_admin, :only => [:index,:destroy]

  def index
    @users = User.all
  end

  def new
  	@user = User.new
  end

  def create
  	@user = User.new(params[:user])  	
  	if @user.save
      flash[:notice]= "Account created successfully!"
  	  redirect_to home_path
  	else
  	  render new_user_path
  	end	
  end 

  def edit
    @user = current_user
  end

  def update
    @user = current_user
    if @user.update_attributes(params[:user])
      flash[:notice] = "Your profile updated successfully."
      redirect_to home_path
    else
      render "edit"
    end
  end

  def show
    @user = User.find(params[:id])
  end

  def destroy
    @user = User.find(params[:id])
    @user.destroy
    redirect_to users_url
  end
end
