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

ActiveRecord::Schema.define(version: 20150509080244) do

  create_table "comments", force: :cascade do |t|
    t.integer  "meeting_id",  limit: 4
    t.integer  "user_id",     limit: 4
    t.text     "commentbody", limit: 65535
    t.datetime "created_at",                null: false
    t.datetime "updated_at",                null: false
  end

  add_index "comments", ["meeting_id"], name: "index_comments_on_meeting_id", using: :btree
  add_index "comments", ["user_id"], name: "index_comments_on_user_id", using: :btree

  create_table "meetings", force: :cascade do |t|
    t.string   "name",                limit: 255
    t.string   "title",               limit: 255
    t.string   "membername",          limit: 255
    t.datetime "date"
    t.integer  "limit",               limit: 4
    t.text     "desc",                limit: 65535
    t.string   "location",            limit: 255
    t.integer  "user_id",             limit: 4
    t.datetime "created_at",                        null: false
    t.datetime "updated_at",                        null: false
    t.string   "avatar_file_name",    limit: 255
    t.string   "avatar_content_type", limit: 255
    t.integer  "avatar_file_size",    limit: 4
    t.datetime "avatar_updated_at"
  end

  add_index "meetings", ["user_id"], name: "index_meetings_on_user_id", using: :btree

  create_table "meetusers", force: :cascade do |t|
    t.integer  "meeting_id", limit: 4
    t.integer  "user_id",    limit: 4
    t.datetime "created_at",           null: false
    t.datetime "updated_at",           null: false
  end

  add_index "meetusers", ["meeting_id"], name: "index_meetusers_on_meeting_id", using: :btree
  add_index "meetusers", ["user_id"], name: "index_meetusers_on_user_id", using: :btree

  create_table "shows", force: :cascade do |t|
    t.integer  "user_id",    limit: 4
    t.datetime "created_at",           null: false
    t.datetime "updated_at",           null: false
  end

  add_index "shows", ["user_id"], name: "index_shows_on_user_id", using: :btree

  create_table "users", force: :cascade do |t|
    t.string   "email",                  limit: 255,   default: "", null: false
    t.string   "encrypted_password",     limit: 255,   default: "", null: false
    t.string   "reset_password_token",   limit: 255
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          limit: 4,     default: 0,  null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip",     limit: 255
    t.string   "last_sign_in_ip",        limit: 255
    t.datetime "created_at"
    t.datetime "updated_at"
    t.boolean  "admin",                  limit: 1
    t.string   "country",                limit: 255
    t.text     "aboutme",                limit: 65535
    t.boolean  "isfemale",               limit: 1
    t.string   "nickname",               limit: 255
    t.string   "avatar_file_name",       limit: 255
    t.string   "avatar_content_type",    limit: 255
    t.integer  "avatar_file_size",       limit: 4
    t.datetime "avatar_updated_at"
  end

  add_index "users", ["email"], name: "index_users_on_email", unique: true, using: :btree
  add_index "users", ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true, using: :btree

  add_foreign_key "comments", "meetings"
  add_foreign_key "comments", "users"
  add_foreign_key "meetings", "users"
  add_foreign_key "meetusers", "meetings"
  add_foreign_key "meetusers", "users"
  add_foreign_key "shows", "users"
end
