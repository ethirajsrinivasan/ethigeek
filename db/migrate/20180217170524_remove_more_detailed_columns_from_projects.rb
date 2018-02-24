class RemoveMoreDetailedColumnsFromProjects < ActiveRecord::Migration[5.0]
  def change
    remove_column :projects, :summary
    remove_column :projects, :learnings
    remove_column :projects, :appreciation
    remove_column :projects, :source_link
    remove_column :projects, :project_link
  end
end
