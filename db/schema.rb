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

ActiveRecord::Schema.define(version: 20160419012602) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "comments", force: :cascade do |t|
    t.integer  "user_id"
    t.integer  "submission_id"
    t.string   "body"
    t.string   "html_body"
    t.datetime "created_at",    null: false
    t.datetime "updated_at",    null: false
  end

  add_index "comments", ["submission_id"], name: "index_comments_on_submission_id", using: :btree
  add_index "comments", ["user_id"], name: "index_comments_on_user_id", using: :btree

  create_table "exercises", force: :cascade do |t|
    t.string   "name"
    t.string   "spec"
    t.string   "encoded_spec"
    t.string   "spec_path"
    t.string   "solution_frame"
    t.string   "encoded_solution_frame"
    t.string   "solution_frame_path"
    t.datetime "created_at",             null: false
    t.datetime "updated_at",             null: false
  end

  create_table "submissions", force: :cascade do |t|
    t.string   "solution"
    t.string   "encoded_solution"
    t.integer  "user_exercise_id"
    t.datetime "created_at",       null: false
    t.datetime "updated_at",       null: false
  end

  add_index "submissions", ["user_exercise_id"], name: "index_submissions_on_user_exercise_id", using: :btree

  create_table "user_exercises", force: :cascade do |t|
    t.integer  "user_id"
    t.integer  "exercise_id"
    t.integer  "iteration_count"
    t.datetime "created_at",      null: false
    t.datetime "updated_at",      null: false
  end

  add_index "user_exercises", ["exercise_id"], name: "index_user_exercises_on_exercise_id", using: :btree
  add_index "user_exercises", ["user_id"], name: "index_user_exercises_on_user_id", using: :btree

  create_table "users", force: :cascade do |t|
    t.string   "provider"
    t.string   "uid"
    t.string   "name"
    t.string   "nickname"
    t.string   "token"
    t.string   "email"
    t.integer  "login_count", default: 0
    t.datetime "created_at",              null: false
    t.datetime "updated_at",              null: false
  end

  add_foreign_key "comments", "submissions"
  add_foreign_key "comments", "users"
  add_foreign_key "submissions", "user_exercises"
  add_foreign_key "user_exercises", "exercises"
  add_foreign_key "user_exercises", "users"
end
