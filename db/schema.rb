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

ActiveRecord::Schema.define(version: 20140617094408) do

  create_table "contact_lists", force: true do |t|
    t.integer  "user_id"
    t.integer  "friend_id"
    t.string   "friend_type"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "contact_lists", ["friend_id", "friend_type"], name: "index_contact_lists_on_friend_id_and_friend_type"
  add_index "contact_lists", ["user_id"], name: "index_contact_lists_on_user_id"

  create_table "contacts", force: true do |t|
    t.string   "first_name"
    t.string   "last_name"
    t.string   "second_name"
    t.string   "email"
    t.string   "phone"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.boolean  "male"
  end

  create_table "places", force: true do |t|
    t.string   "address"
    t.text     "description"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "name"
    t.integer  "user_id"
  end

  add_index "places", ["user_id"], name: "index_places_on_user_id"

  create_table "remarks", force: true do |t|
    t.integer  "user_id"
    t.string   "topic"
    t.text     "description"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "remarks", ["user_id"], name: "index_remarks_on_user_id"

  create_table "task_users", force: true do |t|
    t.integer  "task_id"
    t.integer  "group_id"
    t.string   "group_type"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "task_users", ["group_id", "group_type"], name: "index_task_users_on_group_id_and_group_type"
  add_index "task_users", ["task_id"], name: "index_task_users_on_task_id"

  create_table "tasks", force: true do |t|
    t.integer  "user_id"
    t.integer  "place_id"
    t.integer  "priority"
    t.datetime "date"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "name"
  end

  add_index "tasks", ["place_id"], name: "index_tasks_on_place_id"
  add_index "tasks", ["user_id"], name: "index_tasks_on_user_id"

  create_table "users", force: true do |t|
    t.string   "first_name"
    t.string   "last_name"
    t.string   "second_name"
    t.boolean  "male"
    t.datetime "birthday"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "password_digest"
    t.string   "email"
    t.string   "phone"
    t.string   "avatar_file_name"
    t.string   "avatar_content_type"
    t.integer  "avatar_file_size"
    t.datetime "avatar_updated_at"
  end

end
