# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# This file is the source Rails uses to define your schema when running `bin/rails
# db:schema:load`. When creating a new database, `bin/rails db:schema:load` tends to
# be faster and is potentially less error prone than running all of your
# migrations from scratch. Old migrations may fail to apply correctly if those
# migrations use external dependencies or application code.
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema[7.2].define(version: 2024_12_21_232534) do
  create_table "meeting_hours", force: :cascade do |t|
    t.time "from_hour"
    t.time "to_hour"
    t.date "day_when"
    t.integer "meeting_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["meeting_id"], name: "index_meeting_hours_on_meeting_id"
  end

  create_table "meeting_types", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "meetings", force: :cascade do |t|
    t.text "notes"
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "duration"
    t.integer "teacher_id"
    t.integer "meeting_type_id"
  end

  create_table "parent_meetings", force: :cascade do |t|
    t.integer "meeting_id", null: false
    t.integer "parent_id", null: false
    t.time "meeting_hour"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.date "day_when"
    t.index ["meeting_id", "parent_id"], name: "index_parent_meetings_on_meeting_id_and_parent_id", unique: true
    t.index ["meeting_id"], name: "index_parent_meetings_on_meeting_id"
    t.index ["parent_id"], name: "index_parent_meetings_on_parent_id"
  end

  create_table "teacher_parent_mappings", force: :cascade do |t|
    t.integer "teacher_id", null: false
    t.integer "parent_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["parent_id"], name: "index_teacher_parent_mappings_on_parent_id"
    t.index ["teacher_id", "parent_id"], name: "index_teacher_parent_mappings_on_teacher_id_and_parent_id", unique: true
    t.index ["teacher_id"], name: "index_teacher_parent_mappings_on_teacher_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.string "type"
    t.datetime "last_login_at", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "first_name"
    t.string "last_name"
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
    t.index ["type"], name: "index_users_on_type"
  end

  add_foreign_key "meeting_hours", "meetings"
  add_foreign_key "parent_meetings", "meetings"
  add_foreign_key "parent_meetings", "users", column: "parent_id"
  add_foreign_key "teacher_parent_mappings", "users", column: "parent_id"
  add_foreign_key "teacher_parent_mappings", "users", column: "teacher_id"
end
