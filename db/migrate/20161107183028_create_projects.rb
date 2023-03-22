class CreateProjects < ActiveRecord::Migration[7.0]
  def change
    create_table "projects", id: :serial, force: :cascade do |t|
    t.string "title"
    t.string "duration"
    t.string "role"
    t.string "tools"
    t.string "tasks"
    t.string "team"
    t.string "platform"
    t.string "collaborators"
    t.string "color"
    t.string "image_url"
    t.integer "likes", default: 0
    t.string "filter_types"
    t.integer "order"
    t.string "status", default: "draft"
    t.timestamps
  end
  end
end
