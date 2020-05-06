# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# Note that this schema.rb definition is the authoritative source for your
# database schema. If you need to create the application database on another
# system, you should be using db:schema:load, not running all the migrations
# from scratch. The latter is a flawed and unsustainable approach (the more migrations
# you'll amass, the slower it'll run and the greater likelihood for issues).
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 2019_11_27_120748) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "active_storage_attachments", force: :cascade do |t|
    t.string "name", null: false
    t.string "record_type", null: false
    t.bigint "record_id", null: false
    t.bigint "blob_id", null: false
    t.datetime "created_at", null: false
    t.index ["blob_id"], name: "index_active_storage_attachments_on_blob_id"
    t.index ["record_type", "record_id", "name", "blob_id"], name: "index_active_storage_attachments_uniqueness", unique: true
  end

  create_table "active_storage_blobs", force: :cascade do |t|
    t.string "key", null: false
    t.string "filename", null: false
    t.string "content_type"
    t.text "metadata"
    t.bigint "byte_size", null: false
    t.string "checksum", null: false
    t.datetime "created_at", null: false
    t.index ["key"], name: "index_active_storage_blobs_on_key", unique: true
  end

  create_table "bugs", force: :cascade do |t|
    t.string "title"
    t.date "deadline"
    t.string "typed"
    t.string "status"
    t.bigint "projectt_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "user_id"
    t.bigint "creator_id"
    t.bigint "developer_id"
    t.index ["creator_id"], name: "index_bugs_on_creator_id"
    t.index ["developer_id"], name: "index_bugs_on_developer_id"
    t.index ["projectt_id"], name: "index_bugs_on_projectt_id"
    t.index ["user_id"], name: "index_bugs_on_user_id"
  end

  create_table "projectts", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "user_id"
    t.index ["user_id"], name: "index_projectts_on_user_id"
  end

  create_table "projectusers", force: :cascade do |t|
    t.bigint "user_id"
    t.bigint "projectt_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["projectt_id"], name: "index_projectusers_on_projectt_id"
    t.index ["user_id", "projectt_id"], name: "index_projectusers_on_user_id_and_projectt_id", unique: true
    t.index ["user_id"], name: "index_projectusers_on_user_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.string "name"
    t.integer "user_type"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  add_foreign_key "active_storage_attachments", "active_storage_blobs", column: "blob_id"
  add_foreign_key "bugs", "projectts"
  add_foreign_key "bugs", "users"
  add_foreign_key "bugs", "users", column: "creator_id"
  add_foreign_key "bugs", "users", column: "developer_id"
  add_foreign_key "projectts", "users"
  add_foreign_key "projectusers", "projectts"
  add_foreign_key "projectusers", "users"
end
