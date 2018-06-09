class AddPictureToBlog < ActiveRecord::Migration[5.2]
  def change
  	add_column :blogs, :picture, :string
  end
end
