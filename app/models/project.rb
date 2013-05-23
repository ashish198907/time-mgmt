class Project < ActiveRecord::Base
  attr_accessible :department, :desc, :end_date, :name, :start_date
  validates :desc, :name, :presence => true
  validates :department, :end_date, :start_date, :presence => {:message => "must be selected."}

  has_many :user_projects
  has_many :users, :through => :user_projects
  has_many :timesheets, :dependent => :destroy
end
