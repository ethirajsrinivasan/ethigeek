class CreateSections < ActiveRecord::Migration[5.0]
  def change
    create_table :sections do |t|
      t.integer :order
      t.string :title
      t.text :content
      t.integer :project_id,

      t.timestamps
    end
  end
end
