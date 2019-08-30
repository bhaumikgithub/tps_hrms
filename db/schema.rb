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

ActiveRecord::Schema.define(version: 2019_08_27_114348) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "companies", force: :cascade do |t|
    t.string "comp_name"
    t.text "comp_address"
    t.string "comp_contact"
    t.string "comp_email"
    t.string "website_link"
    t.string "subdomain"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "holidays", force: :cascade do |t|
    t.string "holiday_name"
    t.datetime "holiday_date"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "leaves", force: :cascade do |t|
    t.string "leave_type"
    t.bigint "user_id"
    t.datetime "leave_date"
    t.bigint "approved_by_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.date "end_date"
    t.string "color"
    t.string "status"
    t.index ["approved_by_id"], name: "index_leaves_on_approved_by_id"
    t.index ["user_id"], name: "index_leaves_on_user_id"
  end

  create_table "roles", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "users", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.string "first_name"
    t.string "last_name"
    t.string "personal_email"
    t.string "comp_email"
    t.string "emergency_contact"
    t.string "contact"
    t.date "birthday"
    t.string "marital_status"
    t.date "anniversary_date"
    t.date "join_date"
    t.string "job_status"
    t.string "address"
    t.string "degree"
    t.string "college"
    t.string "experience"
    t.string "designation"
    t.string "mentor"
    t.string "dept"
    t.string "adhar_no"
    t.string "pan_no"
    t.string "user_type"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "role_id"
    t.bigint "company_id"
    t.index ["company_id"], name: "index_users_on_company_id"
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
    t.index ["role_id"], name: "index_users_on_role_id"
  end

  add_foreign_key "leaves", "users"
  add_foreign_key "leaves", "users", column: "approved_by_id"
  add_foreign_key "users", "companies"
  add_foreign_key "users", "roles"
end
