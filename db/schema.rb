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

ActiveRecord::Schema.define(version: 2024_02_06_132157) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "pg_stat_statements"
  enable_extension "plpgsql"

  create_table "active_storage_attachments", force: :cascade do |t|
    t.string "name", null: false
    t.string "record_type", null: false
    t.bigint "record_id", null: false
    t.bigint "blob_id", null: false
    t.datetime "created_at", null: false
    t.index ["blob_id"], name: "index_active_storage_attachments_on_blob_id"
    t.index ["record_type", "record_id", "name", "blob_id"], name: "index_active_storage_attachments_uniqueness", unique: true
  end

  create_table "active_storage_blobs", force: :cascade do |t|
    t.string "key", null: false
    t.string "filename", null: false
    t.string "content_type"
    t.text "metadata"
    t.bigint "byte_size", null: false
    t.string "checksum", null: false
    t.datetime "created_at", null: false
    t.index ["key"], name: "index_active_storage_blobs_on_key", unique: true
  end

  create_table "arrange_sessions", force: :cascade do |t|
    t.string "topic"
    t.string "description"
    t.datetime "date"
    t.time "timing"
    t.string "speaker"
    t.bigint "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "place"
    t.string "applicants"
    t.index ["user_id"], name: "index_arrange_sessions_on_user_id"
  end

  create_table "asset_histories", force: :cascade do |t|
    t.bigint "user_id"
    t.bigint "asset_id"
    t.datetime "from_date"
    t.datetime "to_date"
    t.boolean "active"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.boolean "till_today", default: false
    t.index ["asset_id"], name: "index_asset_histories_on_asset_id"
    t.index ["user_id"], name: "index_asset_histories_on_user_id"
  end

  create_table "asset_types", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "assets", force: :cascade do |t|
    t.string "name"
    t.string "bought_type"
    t.string "code"
    t.string "price"
    t.text "specification"
    t.string "current_status"
    t.string "notes"
    t.bigint "asset_type_id"
    t.bigint "bill_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "warranty"
    t.index ["asset_type_id"], name: "index_assets_on_asset_type_id"
    t.index ["bill_id"], name: "index_assets_on_bill_id"
  end

  create_table "audits", force: :cascade do |t|
    t.integer "auditable_id"
    t.string "auditable_type"
    t.integer "associated_id"
    t.string "associated_type"
    t.integer "user_id"
    t.string "user_type"
    t.string "username"
    t.string "action"
    t.text "audited_changes"
    t.integer "version", default: 0
    t.string "comment"
    t.string "remote_address"
    t.string "request_uuid"
    t.datetime "created_at"
    t.index ["associated_type", "associated_id"], name: "associated_index"
    t.index ["auditable_type", "auditable_id", "version"], name: "auditable_index"
    t.index ["created_at"], name: "index_audits_on_created_at"
    t.index ["request_uuid"], name: "index_audits_on_request_uuid"
    t.index ["user_id", "user_type"], name: "user_index"
  end

  create_table "bills", force: :cascade do |t|
    t.string "number"
    t.datetime "bill_date"
    t.string "discription"
    t.decimal "amount"
    t.integer "status"
    t.decimal "paid_amount"
    t.string "paid_from"
    t.string "paid_via"
    t.text "paid_notes"
    t.boolean "gst_bill"
    t.datetime "gst_uploaded"
    t.bigint "vendor_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["vendor_id"], name: "index_bills_on_vendor_id"
  end

  create_table "checklist_item_users", force: :cascade do |t|
    t.bigint "user_id"
    t.bigint "checklist_item_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["checklist_item_id"], name: "index_checklist_item_users_on_checklist_item_id"
    t.index ["user_id"], name: "index_checklist_item_users_on_user_id"
  end

  create_table "checklist_items", force: :cascade do |t|
    t.string "name"
    t.bigint "checklist_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["checklist_id"], name: "index_checklist_items_on_checklist_id"
  end

  create_table "checklist_users", force: :cascade do |t|
    t.bigint "user_id"
    t.bigint "checklist_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["checklist_id"], name: "index_checklist_users_on_checklist_id"
    t.index ["user_id"], name: "index_checklist_users_on_user_id"
  end

  create_table "checklists", force: :cascade do |t|
    t.string "category"
    t.integer "status", default: 0
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "position"
  end

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

  create_table "consultant_handbooks", force: :cascade do |t|
    t.string "section"
    t.text "content"
    t.integer "position"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "credential_types", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "credentials", force: :cascade do |t|
    t.string "project_name"
    t.text "notes"
    t.string "last_updated_by"
    t.bigint "credential_type_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "email"
    t.string "password"
    t.string "username"
    t.string "link"
    t.index ["credential_type_id"], name: "index_credentials_on_credential_type_id"
  end

  create_table "degrees", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "user_id"
    t.index ["user_id"], name: "index_degrees_on_user_id"
  end

  create_table "departments", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "user_id"
    t.index ["user_id"], name: "index_departments_on_user_id"
  end

  create_table "designations", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "user_id"
    t.index ["user_id"], name: "index_designations_on_user_id"
  end

  create_table "documents", force: :cascade do |t|
    t.string "name"
    t.bigint "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["user_id"], name: "index_documents_on_user_id"
  end

  create_table "educations", force: :cascade do |t|
    t.string "college"
    t.string "university"
    t.datetime "from"
    t.datetime "to"
    t.boolean "is_current", default: false
    t.bigint "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "degree_id"
    t.index ["degree_id"], name: "index_educations_on_degree_id"
    t.index ["user_id"], name: "index_educations_on_user_id"
  end

  create_table "employee_handbooks", force: :cascade do |t|
    t.string "section"
    t.text "content"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "position"
  end

  create_table "event_categories", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "event_links", force: :cascade do |t|
    t.string "title"
    t.text "description"
    t.string "link"
    t.bigint "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.date "event_date"
    t.bigint "event_category_id"
    t.index ["event_category_id"], name: "index_event_links_on_event_category_id"
    t.index ["user_id"], name: "index_event_links_on_user_id"
  end

  create_table "free_leaves", force: :cascade do |t|
    t.bigint "user_id"
    t.float "extra_leave"
    t.text "reason"
    t.date "leave_month"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["user_id"], name: "index_free_leaves_on_user_id"
  end

  create_table "holidays", force: :cascade do |t|
    t.string "holiday_name"
    t.datetime "holiday_date"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "leave_reports", force: :cascade do |t|
    t.bigint "user_id"
    t.date "start_month"
    t.date "end_month"
    t.float "prev_month_leave_bal"
    t.float "free_leave"
    t.float "taken_leave"
    t.float "current_leave_bal"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["user_id"], name: "index_leave_reports_on_user_id"
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

  create_table "permissions", force: :cascade do |t|
    t.string "subject_class"
    t.string "action"
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "project_members", force: :cascade do |t|
    t.bigint "project_id"
    t.bigint "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["project_id"], name: "index_project_members_on_project_id"
    t.index ["user_id"], name: "index_project_members_on_user_id"
  end

  create_table "projects", force: :cascade do |t|
    t.string "name"
    t.text "description"
    t.bigint "department_id"
    t.string "manager"
    t.string "client_name"
    t.date "start_date"
    t.date "end_date"
    t.string "status"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["department_id"], name: "index_projects_on_department_id"
  end

  create_table "reminder_users", force: :cascade do |t|
    t.bigint "reminder_id"
    t.bigint "assigned_to_user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["assigned_to_user_id"], name: "index_reminder_users_on_assigned_to_user_id"
    t.index ["reminder_id"], name: "index_reminder_users_on_reminder_id"
  end

  create_table "reminders", force: :cascade do |t|
    t.datetime "reminder_date_time"
    t.text "content"
    t.integer "status", default: 0
    t.bigint "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "title"
    t.index ["user_id"], name: "index_reminders_on_user_id"
  end

  create_table "role_permissions", force: :cascade do |t|
    t.bigint "permission_id"
    t.bigint "role_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["permission_id"], name: "index_role_permissions_on_permission_id"
    t.index ["role_id"], name: "index_role_permissions_on_role_id"
  end

  create_table "roles", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "trackers", force: :cascade do |t|
    t.bigint "user_id"
    t.string "project_name"
    t.string "tracker_name"
    t.date "start_date"
    t.date "end_date"
    t.boolean "is_current", default: false
    t.boolean "no_tracker", default: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["user_id"], name: "index_trackers_on_user_id"
  end

  create_table "user_designations", force: :cascade do |t|
    t.bigint "designation_id"
    t.bigint "department_id"
    t.string "mentor"
    t.datetime "start_date"
    t.datetime "end_date"
    t.bigint "user_id"
    t.boolean "is_current", default: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["department_id"], name: "index_user_designations_on_department_id"
    t.index ["designation_id"], name: "index_user_designations_on_designation_id"
    t.index ["user_id"], name: "index_user_designations_on_user_id"
  end

  create_table "user_reports", force: :cascade do |t|
    t.time "start_time"
    t.time "end_time"
    t.date "date"
    t.text "detail"
    t.string "total_hours"
    t.bigint "project_member_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["project_member_id"], name: "index_user_reports_on_project_member_id"
  end

  create_table "user_types", force: :cascade do |t|
    t.string "employee_type"
    t.datetime "start_date"
    t.datetime "end_date"
    t.bigint "user_id"
    t.boolean "is_current", default: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["user_id"], name: "index_user_types_on_user_id"
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
    t.datetime "birthday"
    t.string "marital_status"
    t.datetime "anniversary_date"
    t.datetime "join_date"
    t.string "job_status"
    t.string "address"
    t.string "college"
    t.string "mentor"
    t.string "adhar_no"
    t.string "pan_no"
    t.string "user_type"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "role_id"
    t.bigint "company_id"
    t.float "leave_bal"
    t.datetime "leave_added_on"
    t.float "experience"
    t.string "gender"
    t.string "emp_code"
    t.integer "degree_id"
    t.integer "department_id"
    t.integer "designation_id"
    t.datetime "leave_report_added_on"
    t.boolean "is_event_manager", default: false
    t.integer "sign_in_count", default: 0, null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string "current_sign_in_ip"
    t.string "last_sign_in_ip"
    t.datetime "resign_date"
    t.text "resign_reason"
    t.index ["company_id"], name: "index_users_on_company_id"
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
    t.index ["role_id"], name: "index_users_on_role_id"
  end

  create_table "vendors", force: :cascade do |t|
    t.string "name"
    t.string "services"
    t.string "contact_person"
    t.string "mobile"
    t.string "email"
    t.string "gst"
    t.string "pan"
    t.string "tan"
    t.text "address"
    t.string "city"
    t.string "state"
    t.text "description"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.datetime "register_date"
    t.integer "status", default: 0
  end

  create_table "work_histories", force: :cascade do |t|
    t.text "year"
    t.text "mentor"
    t.text "peer"
    t.text "team_member"
    t.bigint "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["user_id"], name: "index_work_histories_on_user_id"
  end

  add_foreign_key "active_storage_attachments", "active_storage_blobs", column: "blob_id"
  add_foreign_key "arrange_sessions", "users"
  add_foreign_key "asset_histories", "assets"
  add_foreign_key "asset_histories", "users"
  add_foreign_key "assets", "asset_types"
  add_foreign_key "assets", "bills"
  add_foreign_key "bills", "vendors"
  add_foreign_key "checklist_item_users", "checklist_items"
  add_foreign_key "checklist_item_users", "users"
  add_foreign_key "checklist_items", "checklists"
  add_foreign_key "checklist_users", "checklists"
  add_foreign_key "checklist_users", "users"
  add_foreign_key "credentials", "credential_types"
  add_foreign_key "degrees", "users"
  add_foreign_key "departments", "users"
  add_foreign_key "designations", "users"
  add_foreign_key "documents", "users"
  add_foreign_key "educations", "degrees"
  add_foreign_key "educations", "users"
  add_foreign_key "event_links", "event_categories"
  add_foreign_key "event_links", "users"
  add_foreign_key "free_leaves", "users"
  add_foreign_key "leave_reports", "users"
  add_foreign_key "leaves", "users"
  add_foreign_key "leaves", "users", column: "approved_by_id"
  add_foreign_key "project_members", "projects"
  add_foreign_key "project_members", "users"
  add_foreign_key "projects", "departments"
  add_foreign_key "reminder_users", "reminders"
  add_foreign_key "reminder_users", "users", column: "assigned_to_user_id"
  add_foreign_key "role_permissions", "permissions"
  add_foreign_key "role_permissions", "roles"
  add_foreign_key "trackers", "users"
  add_foreign_key "user_designations", "departments"
  add_foreign_key "user_designations", "designations"
  add_foreign_key "user_designations", "users"
  add_foreign_key "user_reports", "project_members"
  add_foreign_key "user_types", "users"
  add_foreign_key "users", "companies"
  add_foreign_key "users", "roles"
  add_foreign_key "work_histories", "users"
end
