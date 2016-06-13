class RemoveCompletedDateProjects < ActiveRecord::Migration
  def change
  	remove_column :projects, :completed_date
  end
end
