# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# This file is the source Rails uses to define your schema when running `rails
# db:schema:load`. When creating a new database, `rails db:schema:load` tends to
# be faster and is potentially less error prone than running all of your
# migrations from scratch. Old migrations may fail to apply correctly if those
# migrations use external dependencies or application code.
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 2020_05_20_152856) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "appointments", force: :cascade do |t|
    t.datetime "start_date"
    t.datetime "end_date"
    t.string "observations"
    t.boolean "confirmed"
    t.boolean "active"
    t.boolean "reminder_activated"
    t.bigint "patient_id", null: false
    t.bigint "doctor_id"
    t.bigint "service_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["doctor_id"], name: "index_appointments_on_doctor_id"
    t.index ["patient_id"], name: "index_appointments_on_patient_id"
    t.index ["service_id"], name: "index_appointments_on_service_id"
  end

  create_table "branch_offices", force: :cascade do |t|
    t.bigint "client_id", null: false
    t.bigint "state_catalogue_id", null: false
    t.string "name"
    t.string "razon_social"
    t.string "rfc"
    t.string "city"
    t.string "zip_code"
    t.string "address"
    t.string "logo"
    t.boolean "active"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["client_id"], name: "index_branch_offices_on_client_id"
    t.index ["state_catalogue_id"], name: "index_branch_offices_on_state_catalogue_id"
  end

  create_table "clients", force: :cascade do |t|
    t.string "razon_social"
    t.string "rfc"
    t.string "state"
    t.string "city"
    t.string "zip_code"
    t.string "address"
    t.string "phone_number"
    t.string "mobile_number"
    t.string "logo"
    t.boolean "active"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "clinic_attachments", force: :cascade do |t|
    t.string "file"
    t.bigint "clinic_history_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["clinic_history_id"], name: "index_clinic_attachments_on_clinic_history_id"
  end

  create_table "clinic_histories", force: :cascade do |t|
    t.string "diagnostic"
    t.string "observations"
    t.bigint "patient_id", null: false
    t.bigint "service_id", null: false
    t.bigint "doctor_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["doctor_id"], name: "index_clinic_histories_on_doctor_id"
    t.index ["patient_id"], name: "index_clinic_histories_on_patient_id"
    t.index ["service_id"], name: "index_clinic_histories_on_service_id"
  end

  create_table "doctors", force: :cascade do |t|
    t.string "name"
    t.string "last_name"
    t.string "id_number"
    t.boolean "active"
    t.bigint "branch_office_id", null: false
    t.bigint "user_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["branch_office_id"], name: "index_doctors_on_branch_office_id"
    t.index ["user_id"], name: "index_doctors_on_user_id"
  end

  create_table "medications", force: :cascade do |t|
    t.string "medicament"
    t.integer "quantity"
    t.integer "dosis"
    t.string "frecuency"
    t.integer "duration"
    t.string "sustancy"
    t.bigint "clinic_history_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["clinic_history_id"], name: "index_medications_on_clinic_history_id"
  end

  create_table "patients", force: :cascade do |t|
    t.string "address"
    t.string "phone_number"
    t.string "mobile_number"
    t.datetime "birthdate"
    t.bigint "user_id"
    t.bigint "branch_office_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["branch_office_id"], name: "index_patients_on_branch_office_id"
    t.index ["user_id"], name: "index_patients_on_user_id"
  end

  create_table "service_specialities", force: :cascade do |t|
    t.bigint "service_id", null: false
    t.bigint "speciality_id", null: false
    t.index ["service_id"], name: "index_service_specialities_on_service_id"
    t.index ["speciality_id"], name: "index_service_specialities_on_speciality_id"
  end

  create_table "services", force: :cascade do |t|
    t.string "name"
    t.string "code"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "specialities", force: :cascade do |t|
    t.string "name"
    t.string "code"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "speciality_doctors", force: :cascade do |t|
    t.bigint "speciality_id", null: false
    t.bigint "doctor_id", null: false
    t.index ["doctor_id"], name: "index_speciality_doctors_on_doctor_id"
    t.index ["speciality_id"], name: "index_speciality_doctors_on_speciality_id"
  end

  create_table "state_catalogues", force: :cascade do |t|
    t.string "name"
    t.string "code"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "user_login_historics", force: :cascade do |t|
    t.bigint "user_id", null: false
    t.integer "device_type"
    t.string "signin_ip"
    t.string "user_agent"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["user_id"], name: "index_user_login_historics_on_user_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "name"
    t.string "last_name"
    t.string "email"
    t.string "password_digest"
    t.integer "user_type"
    t.boolean "is_active"
    t.integer "sign_in_count"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.bigint "client_id"
    t.index ["client_id"], name: "index_users_on_client_id"
  end

  add_foreign_key "appointments", "doctors"
  add_foreign_key "appointments", "patients"
  add_foreign_key "appointments", "services"
  add_foreign_key "branch_offices", "clients"
  add_foreign_key "branch_offices", "state_catalogues"
  add_foreign_key "clinic_attachments", "clinic_histories"
  add_foreign_key "clinic_histories", "doctors"
  add_foreign_key "clinic_histories", "patients"
  add_foreign_key "clinic_histories", "services"
  add_foreign_key "doctors", "branch_offices"
  add_foreign_key "doctors", "users"
  add_foreign_key "medications", "clinic_histories"
  add_foreign_key "patients", "branch_offices"
  add_foreign_key "patients", "users"
  add_foreign_key "user_login_historics", "users"
  add_foreign_key "users", "clients"
end
