class User < ActiveRecord::Base

  # attr_accessible :title, :body
  attr_accessible :first_name, :last_name, :dob, :login, :email, :password, :password_confirmation, :logged_in
  

  validates :first_name, :last_name, :presence => true
  validates :dob, :presence => {:message => "must be selected."}
  #acts_as_authentic
  acts_as_authentic do |c|
    c.validate_email_field = true
    c.validate_password_field = true
    c.logged_in_timeout 20.minutes
  end

  has_many :timesheets,  :dependent => :destroy
  has_many :user_projects
  has_many :projects, :through => :user_projects

  def approved_projects
    self.user_projects.select{|p| p.verified?}.map(&:project)
  end
end
