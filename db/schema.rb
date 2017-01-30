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

ActiveRecord::Schema.define(version: 20170124071350) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "activities", force: :cascade do |t|
    t.string   "activityname"
    t.string   "projectname"
    t.string   "link"
    t.datetime "date"
    t.datetime "created_at",   null: false
    t.datetime "updated_at",   null: false
    t.integer  "student_id"
  end

  add_index "activities", ["student_id"], name: "index_activities_on_student_id", using: :btree

  create_table "admin_details", force: :cascade do |t|
    t.string   "name"
    t.string   "email"
    t.string   "phone"
    t.string   "course"
    t.datetime "created_at",    null: false
    t.datetime "updated_at",    null: false
    t.integer  "codewizard_id"
  end

  add_index "admin_details", ["codewizard_id"], name: "index_admin_details_on_codewizard_id", using: :btree

  create_table "admins", force: :cascade do |t|
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
    t.datetime "created_at",                          null: false
    t.datetime "updated_at",                          null: false
  end

  add_index "admins", ["email"], name: "index_admins_on_email", unique: true, using: :btree
  add_index "admins", ["reset_password_token"], name: "index_admins_on_reset_password_token", unique: true, using: :btree

  create_table "codewizards", force: :cascade do |t|
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
    t.datetime "created_at",                          null: false
    t.datetime "updated_at",                          null: false
    t.string   "confirmation_token"
    t.datetime "confirmed_at"
    t.datetime "confirmation_sent_at"
  end

  add_index "codewizards", ["confirmation_token"], name: "index_codewizards_on_confirmation_token", unique: true, using: :btree
  add_index "codewizards", ["email"], name: "index_codewizards_on_email", unique: true, using: :btree
  add_index "codewizards", ["reset_password_token"], name: "index_codewizards_on_reset_password_token", unique: true, using: :btree

  create_table "descriptions", force: :cascade do |t|
    t.string   "singer"
    t.string   "composer"
    t.string   "location"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer  "video_id"
  end

  add_index "descriptions", ["video_id"], name: "index_descriptions_on_video_id", using: :btree

  create_table "details", force: :cascade do |t|
    t.string   "student_name"
    t.string   "parent_name"
    t.string   "your_class"
    t.string   "school"
    t.text     "hobbies"
    t.text     "computer_experience"
    t.text     "aim"
    t.text     "about_me"
    t.datetime "birthday"
    t.datetime "created_at",          null: false
    t.datetime "updated_at",          null: false
    t.integer  "student_id"
    t.string   "secondary_email"
    t.string   "phone_number"
    t.string   "avatar_file_name"
    t.string   "avatar_content_type"
    t.integer  "avatar_file_size"
    t.datetime "avatar_updated_at"
    t.string   "gender"
    t.string   "age"
    t.string   "course_name"
  end

  add_index "details", ["student_id"], name: "index_details_on_student_id", using: :btree

  create_table "events", force: :cascade do |t|
    t.string   "title"
    t.text     "description"
    t.datetime "start_time"
    t.datetime "end_time"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

  create_table "lyrics", force: :cascade do |t|
    t.string   "title"
    t.string   "description"
    t.text     "text"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
    t.string   "read_type"
  end

  create_table "pictures", force: :cascade do |t|
    t.string   "description"
    t.datetime "created_at",         null: false
    t.datetime "updated_at",         null: false
    t.string   "image_file_name"
    t.string   "image_content_type"
    t.integer  "image_file_size"
    t.datetime "image_updated_at"
  end

  create_table "poems", force: :cascade do |t|
    t.string   "link"
    t.string   "title"
    t.string   "author"
    t.string   "duration"
    t.string   "uid"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "stuassignments", force: :cascade do |t|
    t.string   "assignment"
    t.datetime "assigndate"
    t.text     "questions"
    t.string   "course"
    t.datetime "created_at",    null: false
    t.datetime "updated_at",    null: false
    t.integer  "codewizard_id"
  end

  add_index "stuassignments", ["codewizard_id"], name: "index_stuassignments_on_codewizard_id", using: :btree

  create_table "students", force: :cascade do |t|
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
    t.datetime "created_at",                          null: false
    t.datetime "updated_at",                          null: false
    t.string   "confirmation_token"
    t.datetime "confirmed_at"
    t.datetime "confirmation_sent_at"
  end

  add_index "students", ["confirmation_token"], name: "index_students_on_confirmation_token", unique: true, using: :btree
  add_index "students", ["email"], name: "index_students_on_email", unique: true, using: :btree
  add_index "students", ["reset_password_token"], name: "index_students_on_reset_password_token", unique: true, using: :btree

  create_table "videos", force: :cascade do |t|
    t.string   "link"
    t.string   "title"
    t.string   "author"
    t.string   "duration"
    t.datetime "created_at",     null: false
    t.datetime "updated_at",     null: false
    t.string   "uid"
    t.integer  "description_id"
  end

  add_index "videos", ["description_id"], name: "index_videos_on_description_id", using: :btree

  add_foreign_key "activities", "students"
  add_foreign_key "admin_details", "codewizards"
  add_foreign_key "descriptions", "videos"
  add_foreign_key "details", "students"
  add_foreign_key "stuassignments", "codewizards"
  add_foreign_key "videos", "descriptions"
end
