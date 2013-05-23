class CreateUserProjects < ActiveRecord::Migration
  def change
    create_table :user_projects do |t|
      t.references :user
      t.references :project
      t.boolean :verified, :default => false
      t.string :designation
      t.timestamps
    end
  end
end
