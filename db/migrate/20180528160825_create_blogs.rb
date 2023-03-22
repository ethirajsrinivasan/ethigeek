class CreateBlogs < ActiveRecord::Migration[7.0]
  def change
    create_table "blogs", force: :cascade do |t|
    t.string "title", null: false
    t.string "state", default: "draft", null: false
    t.string "content_url", null: false
    t.date "published_at", null: false
    t.string "slug"
    t.integer "likes", default: 0
    t.string "picture"
    t.timestamps
  end
  end
end