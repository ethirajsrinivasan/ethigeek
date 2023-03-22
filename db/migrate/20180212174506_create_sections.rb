class CreateSections < ActiveRecord::Migration[7.0]
  def change
    create_table "sections", id: :serial, force: :cascade do |t|
    t.integer "order"
    t.string "title"
    t.text "content"
    t.integer "project_id"
    t.timestamps
  end
  end
end