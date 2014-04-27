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

ActiveRecord::Schema.define(version: 20140405082140) do

  create_table "milestones", force: true do |t|
    t.string   "name",        null: false
    t.text     "description"
    t.text     "reflections"
    t.string   "image"
    t.integer  "num"
    t.string   "state",       null: false
    t.integer  "project_id",  null: false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "milestones", ["project_id"], name: "index_milestones_on_project_id", using: :btree
  add_index "milestones", ["state"], name: "index_milestones_on_state", using: :btree

  create_table "permissions", force: true do |t|
    t.string   "name"
    t.string   "description"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "projects", force: true do |t|
    t.string   "name",        null: false
    t.string   "image"
    t.text     "description"
    t.integer  "user_id",     null: false
    t.boolean  "is_public",   null: false
    t.string   "state",       null: false
    t.integer  "num"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "projects", ["state"], name: "index_projects_on_state", using: :btree
  add_index "projects", ["user_id"], name: "index_projects_on_user_id", using: :btree

  create_table "user_details", force: true do |t|
    t.string   "name"
    t.text     "description"
    t.string   "avatar"
    t.string   "qqnumber"
    t.integer  "user_id",     null: false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "user_details", ["user_id"], name: "index_user_details_on_user_id", using: :btree

  create_table "users", force: true do |t|
    t.string   "email",                       null: false
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "password_digest"
    t.string   "remember_token"
    t.integer  "permission_id",   default: 1, null: false
  end

  add_index "users", ["email"], name: "index_users_on_email", using: :btree
  add_index "users", ["permission_id"], name: "index_users_on_permission_id", using: :btree
  add_index "users", ["remember_token"], name: "index_users_on_remember_token", using: :btree

end
