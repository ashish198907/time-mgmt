class AddColumnProjectIdToTimesheets < ActiveRecord::Migration
  def change
    add_column :timesheets, :project_id, :integer
  end
end
