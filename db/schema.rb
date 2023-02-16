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

  create_table "artists", force: :cascade do |t|
    t.string "name", null: false
  end

  create_table "characters", force: :cascade do |t|
    t.string "name", null: false
    t.bigint "title_id"
    t.index ["title_id"], name: "index_characters_on_title_id"
  end

  create_table "characters_entities", id: false, force: :cascade do |t|
    t.bigint "entity_id", null: false
    t.bigint "character_id", null: false
  end

  create_table "entities", force: :cascade do |t|
    t.string "file", null: false
    t.string "link"
    t.integer "media_type", default: 0, null: false
    t.integer "rating", default: 0, null: false
    t.integer "origin", default: 0, null: false
    t.bigint "user_id"
    t.bigint "artist_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["artist_id"], name: "index_entities_on_artist_id"
    t.index ["user_id"], name: "index_entities_on_user_id"
  end

  create_table "entities_tags", id: false, force: :cascade do |t|
    t.bigint "entity_id", null: false
    t.bigint "tag_id", null: false
  end

  create_table "entities_titles", id: false, force: :cascade do |t|
    t.bigint "entity_id", null: false
    t.bigint "title_id", null: false
  end

  create_table "tags", force: :cascade do |t|
    t.string "name", null: false
  end

  create_table "titles", force: :cascade do |t|
    t.string "name", null: false
    t.integer "media_type", default: 0, null: false
  end

  create_table "users", force: :cascade do |t|
    t.string "name", null: false
    t.string "email", null: false
    t.string "password_digest"
    t.string "avatar"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

end
