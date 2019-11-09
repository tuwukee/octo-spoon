# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# This file is the source Rails uses to define your schema when running `rails
# db:schema:load`. When creating a new database, `rails db:schema:load` tends to
# be faster and is potentially less error prone than running all of your
# migrations from scratch. Old migrations may fail to apply correctly if those
# migrations use external dependencies or application code.
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 2019_11_09_162710) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "days", force: :cascade do |t|
    t.integer "total"
    t.float "weight"
    t.date "title"
    t.boolean "cycle", default: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "entries", force: :cascade do |t|
    t.jsonb "content", default: "{}"
    t.integer "total"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.bigint "day_id"
    t.string "type"
    t.time "time"
    t.index ["content"], name: "index_entries_on_content", using: :gin
  end

  create_table "products", force: :cascade do |t|
    t.integer "calories"
    t.integer "protein"
    t.integer "fat"
    t.integer "carbohydrate"
    t.string "name"
    t.integer "cellulose"
  end

end
