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


ActiveRecord::Schema.define(version: 20141106021256) do
  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "comments", force: true do |t|
    t.string   "commenter"
    t.text     "body"
    t.integer  "user_id"
    t.integer  "project_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "comments", ["project_id"], name: "index_comments_on_project_id", using: :btree
  add_index "comments", ["user_id"], name: "index_comments_on_user_id", using: :btree

  create_table "directories", force: true do |t|
    t.string   "directory_name"
    t.boolean  "is_terminal"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "directory_classes", force: true do |t|
    t.string   "class_name"
    t.integer  "directory_semester_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "directory_classes", ["directory_semester_id"], name: "index_directory_classes_on_directory_semester_id", using: :btree

  create_table "directory_homeworks", force: true do |t|
    t.string   "class_name"
    t.integer  "directory_class_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "directory_homeworks", ["directory_class_id"], name: "index_directory_homeworks_on_directory_class_id", using: :btree

  create_table "directory_semesters", force: true do |t|
    t.string   "semester_name"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "likes", force: true do |t|
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "user_id"
    t.integer  "project_id"
  end

  add_index "likes", ["project_id"], name: "index_likes_on_project_id", using: :btree
  add_index "likes", ["user_id"], name: "index_likes_on_user_id", using: :btree

  create_table "projects", force: true do |t|
    t.string   "project_name"
    t.text     "description"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "user_id"
    t.integer  "directory_homework_id"
    t.integer  "project_id"
  end

  add_index "projects", ["directory_homework_id"], name: "index_projects_on_directory_homework_id", using: :btree
  add_index "projects", ["project_id"], name: "index_projects_on_project_id", using: :btree
  add_index "projects", ["user_id"], name: "index_projects_on_user_id", using: :btree

  create_table "users", force: true do |t|
    t.string   "email",                  default: "", null: false
    t.string   "encrypted_password",     default: "", null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          default: 0,  null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.inet     "current_sign_in_ip"
    t.inet     "last_sign_in_ip"
    t.string   "user_name",              default: "", null: false
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "student_id",             default: "", null: false
  end

  add_index "users", ["email"], name: "index_users_on_email", unique: true, using: :btree
  add_index "users", ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true, using: :btree
  add_index "users", ["student_id"], name: "index_users_on_student_id", unique: true, using: :btree

end
