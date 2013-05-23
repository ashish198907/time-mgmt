class CreateTimesheets < ActiveRecord::Migration
  def change
    create_table :timesheets do |t|
      t.references :user
      t.date :timesheet_date
      t.string :start_time
      t.string :end_time
      t.text :description
      t.string :total_hours
      t.timestamps
    end
  end
end
