class CreateSettings < ActiveRecord::Migration[7.0]
  def change
    create_table "settings", id: :serial, force: :cascade do |t|
      t.string "var", null: false
      t.text "value"
      t.integer "thing_id"
      t.string "thing_type", limit: 30
      t.timestamps
    end
    add_index :settings, %i(thing_type thing_id var), unique: true
  end
end