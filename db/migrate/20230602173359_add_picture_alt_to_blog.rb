class AddPictureAltToBlog < ActiveRecord::Migration[7.0]
  def change
    add_column(:blogs, :picture_alt, :string)
  end
end
