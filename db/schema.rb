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

ActiveRecord::Schema.define(version: 20171107185933) do

  create_table "duties", force: :cascade do |t|
    t.string   "group_id"
    t.string   "panel_id"
    t.date     "date"
    t.time     "time"
    t.text     "venue"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "friend_requests", force: :cascade do |t|
    t.integer  "user_id"
    t.integer  "friend_id"
    t.boolean  "accepted",       default: false
    t.boolean  "rejected",       default: false
    t.boolean  "pending",        default: true
    t.integer  "sender_roll_no"
    t.integer  "friend_roll_no"
    t.datetime "created_at",                     null: false
    t.datetime "updated_at",                     null: false
    t.index ["friend_id"], name: "index_friend_requests_on_friend_id"
    t.index ["user_id"], name: "index_friend_requests_on_user_id"
  end

  create_table "friendships", force: :cascade do |t|
    t.integer  "user_id"
    t.integer  "friend_id"
    t.integer  "user_roll"
    t.integer  "friend_roll"
    t.integer  "guide"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
    t.string   "group_id"
    t.index ["friend_id"], name: "index_friendships_on_friend_id"
    t.index ["user_id"], name: "index_friendships_on_user_id"
  end

  create_table "panels", force: :cascade do |t|
    t.string   "panel_id"
    t.integer  "teacher_1"
    t.integer  "teacher_2"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "synopses", force: :cascade do |t|
    t.string   "index"
    t.string   "create"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string   "group_id"
    t.string   "title"
    t.string   "ipdr"
    t.string   "opw"
    t.string   "meth"
  end

  create_table "teams", force: :cascade do |t|
    t.string   "group_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "users", force: :cascade do |t|
    t.string   "email",                  default: "", null: false
    t.string   "encrypted_password",     default: "", null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          default: 0,  null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "name"
    t.integer  "role"
    t.integer  "college_roll"
    t.integer  "uni_roll"
    t.string   "year"
    t.string   "branch"
    t.string   "course"
    t.integer  "group_id"
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

end
