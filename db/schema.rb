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

ActiveRecord::Schema[7.0].define(version: 2023_05_30_024236) do
  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "accounts", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "buckets", force: :cascade do |t|
    t.bigint "account_id", null: false
    t.string "bucketable_type", null: false
    t.bigint "bucketable_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["account_id"], name: "index_buckets_on_account_id"
    t.index ["bucketable_type", "bucketable_id"], name: "index_buckets_on_bucketable"
  end

  create_table "communities", force: :cascade do |t|
    t.string "title"
    t.bigint "account_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["account_id"], name: "index_communities_on_account_id"
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
    t.bigint "bucket_id", null: false
    t.string "recordable_type", null: false
    t.bigint "recordable_id", null: false
    t.bigint "parent_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["bucket_id"], name: "index_recordings_on_bucket_id"
    t.index ["parent_id"], name: "index_recordings_on_parent_id"
    t.index ["recordable_type", "recordable_id"], name: "index_recordings_on_recordable"
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

  add_foreign_key "buckets", "accounts"
  add_foreign_key "communities", "accounts"
  add_foreign_key "recordings", "buckets"
  add_foreign_key "recordings", "recordings", column: "parent_id"
end
