class CreateBlogs < ActiveRecord::Migration[5.2]
  def change
    create_table :blogs do |t|
      t.string :title, null: false
      t.string :state,  default: "draft", null: false
      t.string :content_url, null: false
      t.date :published_at, null: false
      t.string :slug, unique: true
      t.integer :likes, default: 0

      t.timestamps
    end
  end
end
