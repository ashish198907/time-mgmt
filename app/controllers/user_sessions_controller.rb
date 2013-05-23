class UserSessionsController < ApplicationController  
  before_filter :require_no_user, :only => [:new, :create]
  before_filter :require_user, :only => :destroy

  def new
    @user_session = UserSession.new
  end
 
  def create
    @user_session = UserSession.new(params[:user_session])
   if @user_session.save
     @user_session.user.update_attributes(:logged_in => true)
     flash[:notice] = "Login successful!"
     redirect_to root_url
   else
     render :action => :new
   end
 end

 def destroy
   current_user_session.user.update_attributes(:logged_in => false)
   current_user_session.destroy
   flash[:notice] = "Logout successful!"
   redirect_to login_path
 end

end