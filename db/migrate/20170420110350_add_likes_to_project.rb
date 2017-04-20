class AddLikesToProject < ActiveRecord::Migration[5.0]
  def change
  	add_column :projects, :likes, :integer,default: 0
  end
end
