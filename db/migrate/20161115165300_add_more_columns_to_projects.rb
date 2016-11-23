class AddMoreColumnsToProjects < ActiveRecord::Migration[5.0]
  def change
  	add_column :projects, :duration, :string
  	add_column :projects, :role, :string
  	add_column :projects, :tools, :string
  	add_column :projects, :tasks, :string
  	add_column :projects, :team, :string
  	add_column :projects, :platform, :string
  	add_column :projects, :collaborators, :string
  end
end
