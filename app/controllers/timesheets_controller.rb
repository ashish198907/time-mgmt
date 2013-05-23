class TimesheetsController < ApplicationController
before_filter :require_user

  def index
    @timesheets = current_user.timesheets.all(:order => 'timesheet_date DESC')
  end
  
  def new
  	@timesheet = Timesheet.new
  end

  def create
  	@timesheet = current_user.timesheets.new(params[:timesheet])  	
  	if @timesheet.save
      flash[:notice]= "Timesheet created successfully!"
  	  redirect_to :action => 'index'
  	else
  	  render :action => "new"
  	end	
  end

  def show
  	@timesheet = Timesheet.find(params[:id])
  end
  
  def destroy
  	timesheet = Timesheet.find(params[:id])
  	timesheet.destroy
  	flash[:notice] = "Timesheet deleted successfully."
  	redirect_to :action => "index"
  end

end

