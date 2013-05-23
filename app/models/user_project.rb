class UserProject < ActiveRecord::Base
  attr_accessible :user_id, :project_id, :verified, :designation
  belongs_to :user
  belongs_to :project
  validates :user_id,:project_id,:designation, :presence => {:message => "must be selected."}
end
