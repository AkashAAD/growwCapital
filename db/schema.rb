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

ActiveRecord::Schema.define(version: 2020_10_03_044529) do

  create_table "active_storage_attachments", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.string "name", null: false
    t.string "record_type", null: false
    t.bigint "record_id", null: false
    t.bigint "blob_id", null: false
    t.datetime "created_at", null: false
    t.index ["blob_id"], name: "index_active_storage_attachments_on_blob_id"
    t.index ["record_type", "record_id", "name", "blob_id"], name: "index_active_storage_attachments_uniqueness", unique: true
  end

  create_table "active_storage_blobs", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.string "key", null: false
    t.string "filename", null: false
    t.string "content_type"
    t.text "metadata"
    t.bigint "byte_size", null: false
    t.string "checksum", null: false
    t.datetime "created_at", null: false
    t.index ["key"], name: "index_active_storage_blobs_on_key", unique: true
  end

  create_table "annual_turnovers", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "banks", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "business_employment_types", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "business_loan_offers", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.integer "business_loan_id"
    t.string "business_name"
    t.integer "business_nature"
    t.integer "industry_type"
    t.integer "business_years"
    t.decimal "current_emi", precision: 20, scale: 2
    t.string "business_pan_number"
    t.integer "residence_type"
    t.text "address_line1"
    t.text "address_line2"
    t.text "landmark"
    t.string "city"
    t.string "state"
    t.string "pincode"
    t.string "gst_number"
    t.integer "annual_turnover"
    t.decimal "gross_annual_profit", precision: 20, scale: 2
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "business_loans", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.decimal "loan_amount", precision: 20, scale: 2
    t.integer "tenure"
    t.string "email"
    t.string "mobile_number"
    t.string "first_name"
    t.string "middle_name"
    t.string "last_name"
    t.string "gender"
    t.string "marital_status"
    t.integer "highest_qualification"
    t.integer "no_of_dependent"
    t.string "current_residency_since_year"
    t.string "current_city_since_year"
    t.string "pan_number"
    t.integer "purpose_of_loan"
    t.text "address_line1"
    t.text "address_line2"
    t.text "landmark"
    t.string "city"
    t.string "state"
    t.string "pincode"
    t.integer "residential_type"
    t.datetime "dob"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "business_natures", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "business_years", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "companies", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "company_types", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "dependent_numbers", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "employer_details", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.integer "personal_loan_id"
    t.string "employer_name"
    t.string "designation"
    t.string "years_in_current_job"
    t.text "office_address_line1"
    t.text "office_address_line2"
    t.text "landmark"
    t.string "office_state"
    t.string "office_city"
    t.string "office_email"
    t.string "office_pincode"
    t.integer "mailing_address"
    t.string "first_name"
    t.string "last_name"
    t.string "mobile_number"
    t.string "ref_mobile_number"
    t.integer "salary_bank_account_name"
    t.string "branch_name"
    t.decimal "monthly_net_salary", precision: 20, scale: 2
    t.decimal "current_emi", precision: 20, scale: 2
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "employers", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "employment_types", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "highest_qualifications", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "home_loan_amounts", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "home_loans", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.integer "loan_amount"
    t.string "property_city"
    t.decimal "annual_income", precision: 20, scale: 2
    t.string "mobile_number"
    t.string "property_type"
    t.decimal "property_cost", precision: 20, scale: 2
    t.integer "current_employment"
    t.decimal "current_emi", precision: 20, scale: 2
    t.string "full_name"
    t.string "email"
    t.datetime "dob"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "industry_types", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "loan_against_properties", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.decimal "current_emi", precision: 20, scale: 2
    t.string "full_name"
    t.datetime "dob"
    t.decimal "property_cost", precision: 20, scale: 2
    t.string "email"
    t.string "property_type"
    t.string "constructed_property"
    t.string "open_land"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "loan_against_property_offers", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.integer "loan_against_property_id"
    t.integer "loan_amount"
    t.integer "employment_type"
    t.string "city"
    t.decimal "annual_income", precision: 20, scale: 2
    t.string "mobile_number"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "loan_purposes", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "mailing_addresses", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "new_car_loans", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.string "registration_state"
    t.string "registration_city"
    t.string "car_manufacturer"
    t.string "car_model"
    t.string "current_residency_since_year"
    t.integer "residence_type"
    t.datetime "dob"
    t.string "gender"
    t.string "profession_status"
    t.integer "current_working_company"
    t.integer "industry_type"
    t.decimal "monthly_salary", precision: 20, scale: 2
    t.string "mobile_number"
    t.string "first_name"
    t.string "last_name"
    t.string "email"
    t.text "res_address_line1"
    t.text "res_address_line2"
    t.string "res_state"
    t.string "res_city"
    t.string "res_pincode"
    t.text "office_address_line1"
    t.text "office_address_line2"
    t.string "office_state"
    t.string "office_city"
    t.string "office_pincode"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "personal_loans", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.string "first_name"
    t.string "middle_name"
    t.string "last_name"
    t.string "gender"
    t.integer "tenure"
    t.string "marital_status"
    t.integer "highest_qualification"
    t.integer "no_of_dependent"
    t.string "current_residency_since_year"
    t.string "current_city_since_year"
    t.string "pan_number"
    t.integer "purpose_of_loan"
    t.string "email"
    t.datetime "dob"
    t.text "address_line1"
    t.text "address_line2"
    t.text "landmark"
    t.string "city"
    t.string "state"
    t.string "pincode"
    t.integer "residential_type"
    t.decimal "loan_amount", precision: 20, scale: 2
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "professional_loan_offers", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.integer "professional_loan_id"
    t.boolean "otp_status"
    t.integer "bank_account_name"
    t.decimal "current_emi", precision: 20, scale: 2
    t.string "full_name"
    t.string "gender"
    t.string "pincode"
    t.string "pancard"
    t.datetime "dob"
    t.integer "residence_type"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "professional_loans", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.decimal "loan_amount", precision: 20, scale: 2
    t.integer "profession_type"
    t.string "current_profession_since_year"
    t.decimal "annual_income", precision: 20, scale: 2
    t.string "residence_city"
    t.string "email"
    t.string "mobile_number"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "professions", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "qualifications", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "residence_types", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "roles", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "stay_city_since_years", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "stay_residence_since_years", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "tenures", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "used_car_loans", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.string "registration_state"
    t.string "registration_city"
    t.string "car_manufacturer"
    t.string "car_model"
    t.string "car_registration_number"
    t.string "model_year"
    t.string "current_residency_since_year"
    t.integer "residence_type"
    t.datetime "dob"
    t.string "gender"
    t.string "profession_status"
    t.integer "current_working_company"
    t.integer "industry_type"
    t.decimal "monthly_salary", precision: 20, scale: 2
    t.string "mobile_number"
    t.string "first_name"
    t.string "last_name"
    t.string "email"
    t.text "res_address_line1"
    t.text "res_address_line2"
    t.string "res_state"
    t.string "res_city"
    t.string "res_pincode"
    t.text "office_address_line1"
    t.text "office_address_line2"
    t.string "office_state"
    t.string "office_city"
    t.string "office_pincode"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "users", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.string "first_name"
    t.string "last_name"
    t.string "mobile_number"
    t.text "full_address"
    t.string "profession"
    t.integer "role_id"
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  add_foreign_key "active_storage_attachments", "active_storage_blobs", column: "blob_id"
end
