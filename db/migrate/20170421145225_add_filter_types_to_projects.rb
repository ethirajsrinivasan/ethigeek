class AddFilterTypesToProjects < ActiveRecord::Migration[5.0]
  def change
  	add_column :projects, :filter_types, :string
  end
end
