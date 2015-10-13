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

ActiveRecord::Schema.define(version: 20151010235941) do

  create_table "edits", force: :cascade do |t|
    t.text     "notes"
    t.text     "line_edits"
    t.text     "suggestion"
    t.integer  "user_id"
    t.integer  "submission_id"
    t.datetime "created_at",    null: false
    t.datetime "updated_at",    null: false
  end

  add_index "edits", ["submission_id"], name: "index_edits_on_submission_id"
  add_index "edits", ["user_id"], name: "index_edits_on_user_id"

  create_table "submissions", force: :cascade do |t|
    t.string   "title"
    t.text     "content"
    t.string   "genre"
    t.text     "summary"
    t.integer  "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_index "submissions", ["user_id"], name: "index_submissions_on_user_id"

  create_table "users", force: :cascade do |t|
    t.string   "username"
    t.string   "first_name"
    t.string   "last_name"
    t.string   "email"
    t.string   "password_digest"
    t.string   "pseudonym"
    t.string   "profile_photo_url"
    t.string   "publications_title"
    t.string   "publications_url"
    t.string   "user_site_title"
    t.string   "user_site_url"
    t.datetime "created_at",         null: false
    t.datetime "updated_at",         null: false
  end

end
