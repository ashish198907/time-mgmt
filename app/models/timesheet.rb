class Timesheet < ActiveRecord::Base
  attr_accessible :timesheet_date, :start_time, :end_time, :description, :total_hours, :project_id
  belongs_to :user
  belongs_to :project
  validates :start_time, :end_time, :description, :total_hours , :presence => true
  validates :timesheet_date, :project_id, :presence => {:message => "must be selected."}
end
