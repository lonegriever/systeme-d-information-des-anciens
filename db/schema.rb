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

ActiveRecord::Schema.define(version: 2019_03_10_053437) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "alumnus_records", force: :cascade do |t|
    t.string "first_name"
    t.string "last_name"
    t.string "email"
    t.string "gender"
    t.date "birth_date"
    t.string "course"
    t.integer "year_graduated"
    t.string "employment_status"
    t.text "reason_for_unemployment"
    t.bigint "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["user_id"], name: "index_alumnus_records_on_user_id"
  end

  create_table "employment_records", force: :cascade do |t|
    t.string "company_name"
    t.string "position"
    t.date "date_started"
    t.bigint "alumnus_record_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["alumnus_record_id"], name: "index_employment_records_on_alumnus_record_id"
  end

  create_table "events", force: :cascade do |t|
    t.string "file"
    t.text "caption"
    t.bigint "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["user_id"], name: "index_events_on_user_id"
  end

  create_table "notifications", force: :cascade do |t|
    t.string "notification_type"
    t.boolean "is_read", default: false
    t.string "notification_details"
    t.bigint "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["user_id"], name: "index_notifications_on_user_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "username"
    t.string "password_digest"
    t.boolean "admin"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "authentication_token"
    t.index ["username"], name: "index_users_on_username", unique: true
  end

  add_foreign_key "alumnus_records", "users"
  add_foreign_key "employment_records", "alumnus_records"
  add_foreign_key "events", "users"
  add_foreign_key "notifications", "users"
end
