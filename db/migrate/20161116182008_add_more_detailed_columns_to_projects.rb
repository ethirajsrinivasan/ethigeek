class AddMoreDetailedColumnsToProjects < ActiveRecord::Migration[5.0]
  def change
  	add_column :projects, :summary, :text
  	add_column :projects, :learnings, :text
  	add_column :projects, :appreciation, :text
  	add_column :projects, :source_link, :text
  	add_column :projects, :project_link, :text
  end
end
