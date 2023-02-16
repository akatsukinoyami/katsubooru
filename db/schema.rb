# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# This file is the source Rails uses to define your schema when running `bin/rails
# db:schema:load`. When creating a new database, `bin/rails db:schema:load` tends to
# be faster and is potentially less error prone than running all of your
# migrations from scratch. Old migrations may fail to apply correctly if those
# migrations use external dependencies or application code.
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema[7.0].define(version: 2023_02_01_005622) do
  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "charachters_entities", id: false, force: :cascade do |t|
    t.bigint "entity_id", null: false
    t.bigint "charachter_id", null: false
  end

  create_table "entities", force: :cascade do |t|
    t.string "file", null: false
    t.string "link"
    t.integer "rating", default: 0, null: false
    t.bigint "user_id"
    t.bigint "origin_id"
    t.bigint "author_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["author_id"], name: "index_entities_on_author_id"
    t.index ["origin_id"], name: "index_entities_on_origin_id"
    t.index ["user_id"], name: "index_entities_on_user_id"
  end

  create_table "entities_generals", id: false, force: :cascade do |t|
    t.bigint "entity_id", null: false
    t.bigint "general_id", null: false
  end

  create_table "entities_titles", id: false, force: :cascade do |t|
    t.bigint "entity_id", null: false
    t.bigint "title_id", null: false
  end

  create_table "tags", force: :cascade do |t|
    t.string "type"
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "users", force: :cascade do |t|
    t.string "name", null: false
    t.string "avatar"
    t.string "email"
    t.string "password_digest"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

end
