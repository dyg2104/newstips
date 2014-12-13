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

ActiveRecord::Schema.define(version: 20141213205110) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "tips", force: true do |t|
    t.string   "name"
    t.text     "text",       null: false
    t.string   "email"
    t.string   "city"
    t.string   "state"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "subject"
  end

  add_index "tips", ["city"], name: "index_tips_on_city", using: :btree
  add_index "tips", ["name"], name: "index_tips_on_name", using: :btree
  add_index "tips", ["state"], name: "index_tips_on_state", using: :btree

  create_table "user_saves", force: true do |t|
    t.integer  "user_id"
    t.integer  "tip_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "user_saves", ["tip_id"], name: "index_user_saves_on_tip_id", using: :btree
  add_index "user_saves", ["user_id"], name: "index_user_saves_on_user_id", using: :btree

  create_table "user_views", force: true do |t|
    t.integer  "user_id"
    t.integer  "tip_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "user_views", ["tip_id"], name: "index_user_views_on_tip_id", using: :btree
  add_index "user_views", ["user_id"], name: "index_user_views_on_user_id", using: :btree

  create_table "users", force: true do |t|
    t.string   "name",            null: false
    t.string   "password_digest", null: false
    t.string   "session_token",   null: false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "users", ["name"], name: "index_users_on_name", using: :btree
  add_index "users", ["session_token"], name: "index_users_on_session_token", using: :btree

end
