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

ActiveRecord::Schema[7.0].define(version: 2023_06_08_065536) do
  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "accounts", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "communities", force: :cascade do |t|
    t.string "title"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "edges", force: :cascade do |t|
    t.bigint "source_id", null: false
    t.bigint "dest_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["dest_id"], name: "index_edges_on_dest_id"
    t.index ["source_id"], name: "index_edges_on_source_id"
  end

  create_table "learning_modules", force: :cascade do |t|
    t.string "title"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "pathways", force: :cascade do |t|
    t.string "subject"
    t.string "content"
  end

  create_table "recordings", force: :cascade do |t|
    t.bigint "account_id", null: false
    t.string "recordable_type", null: false
    t.bigint "recordable_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["account_id"], name: "index_recordings_on_account_id"
    t.index ["recordable_type", "recordable_id"], name: "index_recordings_on_recordable"
  end

  create_table "relationships", force: :cascade do |t|
    t.string "source_type", null: false
    t.bigint "source_id", null: false
    t.string "dest_type", null: false
    t.bigint "dest_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["dest_type", "dest_id"], name: "index_relationships_on_dest"
    t.index ["source_type", "source_id", "dest_type", "dest_id"], name: "index_relationships_on_source_and_dest", unique: true
    t.index ["source_type", "source_id"], name: "index_relationships_on_source"
  end

  create_table "skills", force: :cascade do |t|
    t.string "content"
  end

  create_table "tutorials", force: :cascade do |t|
    t.string "title"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "users", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_foreign_key "edges", "recordings", column: "dest_id"
  add_foreign_key "edges", "recordings", column: "source_id"
  add_foreign_key "recordings", "accounts"
end
