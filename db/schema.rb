# encoding: UTF-8
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

ActiveRecord::Schema.define(version: 20150921213243) do

  create_table "ckeditor_assets", force: :cascade do |t|
    t.string   "data_file_name",    limit: 255, null: false
    t.string   "data_content_type", limit: 255
    t.integer  "data_file_size",    limit: 4
    t.integer  "assetable_id",      limit: 4
    t.string   "assetable_type",    limit: 30
    t.string   "type",              limit: 30
    t.integer  "width",             limit: 4
    t.integer  "height",            limit: 4
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "ckeditor_assets", ["assetable_type", "assetable_id"], name: "idx_ckeditor_assetable", using: :btree
  add_index "ckeditor_assets", ["assetable_type", "type", "assetable_id"], name: "idx_ckeditor_assetable_type", using: :btree

  create_table "my_admin_configurations", force: :cascade do |t|
    t.string   "key",        limit: 255
    t.string   "name",       limit: 255
    t.string   "field_type", limit: 255
    t.string   "hint",       limit: 255
    t.text     "value",      limit: 65535
    t.boolean  "required",   limit: 1
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "my_admin_group_permissions", force: :cascade do |t|
    t.integer  "permission_id", limit: 4
    t.integer  "group_id",      limit: 4
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "my_admin_group_permissions", ["permission_id", "group_id"], name: "my_admin_group_permissions_index", unique: true, using: :btree

  create_table "my_admin_groups", force: :cascade do |t|
    t.string   "name",        limit: 30,    null: false
    t.text     "description", limit: 65535
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "my_admin_groups", ["name"], name: "index_my_admin_groups_on_name", unique: true, using: :btree

  create_table "my_admin_locales", force: :cascade do |t|
    t.string   "name",       limit: 255
    t.string   "acronym",    limit: 255
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "my_admin_locales", ["acronym"], name: "index_my_admin_locales_on_acronym", unique: true, using: :btree
  add_index "my_admin_locales", ["name"], name: "index_my_admin_locales_on_name", unique: true, using: :btree

  create_table "my_admin_logs", force: :cascade do |t|
    t.integer  "user_id",     limit: 4,   null: false
    t.string   "object",      limit: 255, null: false
    t.string   "action",      limit: 255, null: false
    t.string   "model",       limit: 255, null: false
    t.string   "application", limit: 255, null: false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "my_admin_logs", ["user_id"], name: "index_my_admin_logs_on_user_id", using: :btree

  create_table "my_admin_permissions", force: :cascade do |t|
    t.string   "model",       limit: 75, null: false
    t.string   "name",        limit: 75, null: false
    t.string   "application", limit: 75, null: false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "my_admin_user_groups", force: :cascade do |t|
    t.integer  "user_id",    limit: 4
    t.integer  "group_id",   limit: 4
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "my_admin_user_groups", ["user_id", "group_id"], name: "my_admin_user_groups_index", unique: true, using: :btree

  create_table "my_admin_users", force: :cascade do |t|
    t.string   "first_name",         limit: 255, default: "",    null: false
    t.string   "last_name",          limit: 255, default: "",    null: false
    t.string   "username",           limit: 255, default: "",    null: false
    t.boolean  "superuser",          limit: 1,   default: false, null: false
    t.string   "email",              limit: 255,                 null: false
    t.boolean  "active",             limit: 1,   default: true,  null: false
    t.string   "salt",               limit: 255,                 null: false
    t.string   "encrypted_password", limit: 255,                 null: false
    t.string   "photo_file_name",    limit: 255
    t.string   "photo_content_type", limit: 255
    t.integer  "photo_file_size",    limit: 4
    t.datetime "photo_updated_at"
    t.string   "encrypted_recover",  limit: 255
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "profiles", force: :cascade do |t|
    t.string   "name",                   limit: 255
    t.datetime "created_at",                                      null: false
    t.datetime "updated_at",                                      null: false
    t.string   "email",                  limit: 255, default: "", null: false
    t.string   "encrypted_password",     limit: 255, default: "", null: false
    t.string   "reset_password_token",   limit: 255
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          limit: 4,   default: 0,  null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip",     limit: 255
    t.string   "last_sign_in_ip",        limit: 255
    t.string   "confirmation_token",     limit: 255
    t.datetime "confirmed_at"
    t.datetime "confirmation_sent_at"
    t.string   "unconfirmed_email",      limit: 255
  end

  add_index "profiles", ["email"], name: "index_profiles_on_email", unique: true, using: :btree
  add_index "profiles", ["reset_password_token"], name: "index_profiles_on_reset_password_token", unique: true, using: :btree

  create_table "sports", force: :cascade do |t|
    t.string   "name",       limit: 255
    t.datetime "created_at",             null: false
    t.datetime "updated_at",             null: false
  end

end
