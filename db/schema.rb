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

ActiveRecord::Schema.define(version: 2021_05_22_042754) do

  create_table "active_storage_attachments", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8mb3", force: :cascade do |t|
    t.string "name", null: false
    t.string "record_type", null: false
    t.bigint "record_id", null: false
    t.bigint "blob_id", null: false
    t.datetime "created_at", null: false
    t.index ["blob_id"], name: "index_active_storage_attachments_on_blob_id"
    t.index ["record_type", "record_id", "name", "blob_id"], name: "index_active_storage_attachments_uniqueness", unique: true
  end

  create_table "active_storage_blobs", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8mb3", force: :cascade do |t|
    t.string "key", null: false
    t.string "filename", null: false
    t.string "content_type"
    t.text "metadata"
    t.bigint "byte_size", null: false
    t.string "checksum", null: false
    t.datetime "created_at", null: false
    t.index ["key"], name: "index_active_storage_blobs_on_key", unique: true
  end

  create_table "annual_turnovers", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8mb3", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "banks", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8mb3", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "business_employment_types", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8mb3", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "business_loan_bank_infos", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8mb3", force: :cascade do |t|
    t.decimal "roi", precision: 20, scale: 2
    t.decimal "processing_fee", precision: 20, scale: 2
    t.text "preprocessing_charges"
    t.integer "business_loan_bank_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["business_loan_bank_id"], name: "index_business_loan_bank_infos_on_business_loan_bank_id"
  end

  create_table "business_loan_banks", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8mb3", force: :cascade do |t|
    t.string "name"
    t.string "slug"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "business_loans", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8mb3", force: :cascade do |t|
    t.decimal "loan_amount", precision: 20, scale: 2
    t.integer "tenure"
    t.string "email"
    t.string "mobile_number"
    t.string "full_name"
    t.integer "annual_turnover"
    t.decimal "gross_annual_profit", precision: 20, scale: 2
    t.integer "company_type"
    t.integer "business_nature"
    t.decimal "current_emi", precision: 20, scale: 2
    t.text "address"
    t.string "city"
    t.string "pincode"
    t.text "business_address"
    t.string "business_city"
    t.string "business_pincode"
    t.datetime "dob"
    t.integer "otp"
    t.integer "bank_name"
    t.boolean "otp_verified", default: false
    t.string "reference_number"
    t.boolean "terms_and_conditions"
    t.integer "business_loan_bank_id"
    t.string "status"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["business_loan_bank_id"], name: "index_business_loans_on_business_loan_bank_id"
  end

  create_table "business_natures", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8mb3", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "business_years", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8mb3", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "car_manufacturers", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8mb3", force: :cascade do |t|
    t.string "name"
    t.string "slug"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "car_models", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8mb3", force: :cascade do |t|
    t.string "name"
    t.string "slug"
    t.integer "car_manufacturer_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "cards", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8mb3", force: :cascade do |t|
    t.string "name"
    t.decimal "joining_charge", precision: 20, scale: 2
    t.decimal "annual_charge", precision: 20, scale: 2
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "cities", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8mb3", force: :cascade do |t|
    t.string "name"
    t.string "slug"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "companies", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8mb3", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "company_types", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8mb3", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "contact_us", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8mb3", force: :cascade do |t|
    t.string "email"
    t.string "first_name"
    t.string "last_name"
    t.string "subject"
    t.text "message"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "credit_cards", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8mb3", force: :cascade do |t|
    t.string "mobile_number"
    t.integer "otp"
    t.boolean "otp_verified", default: false
    t.string "reference_number"
    t.boolean "terms_and_conditions"
    t.string "status"
    t.integer "employment_type"
    t.string "email"
    t.datetime "dob"
    t.string "full_name"
    t.boolean "existing_card", default: false
    t.integer "card_id"
    t.text "address"
    t.string "city"
    t.string "pincode"
    t.text "office_address"
    t.string "office_city"
    t.string "office_pincode"
    t.integer "bank_name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["card_id"], name: "index_credit_cards_on_card_id"
  end

  create_table "custom_business_loans", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8mb3", force: :cascade do |t|
    t.string "full_name"
    t.string "mobile_number"
    t.string "email"
    t.integer "loan_purpose"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "custom_credit_cards", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8mb3", force: :cascade do |t|
    t.string "full_name"
    t.string "mobile_number"
    t.string "email"
    t.integer "loan_purpose"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "custom_home_loans", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8mb3", force: :cascade do |t|
    t.string "full_name"
    t.string "mobile_number"
    t.string "email"
    t.integer "loan_purpose"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "custom_loan_against_properties", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8mb3", force: :cascade do |t|
    t.string "full_name"
    t.string "mobile_number"
    t.string "email"
    t.integer "loan_purpose"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "custom_new_car_loans", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8mb3", force: :cascade do |t|
    t.string "full_name"
    t.string "mobile_number"
    t.string "email"
    t.integer "loan_purpose"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "custom_personal_loans", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8mb3", force: :cascade do |t|
    t.string "full_name"
    t.string "mobile_number"
    t.string "email"
    t.integer "loan_purpose"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "custom_professional_loans", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8mb3", force: :cascade do |t|
    t.string "full_name"
    t.string "mobile_number"
    t.string "email"
    t.integer "loan_purpose"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "custom_transfer_home_loans", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8mb3", force: :cascade do |t|
    t.string "full_name"
    t.string "mobile_number"
    t.string "email"
    t.integer "loan_purpose"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "custom_transfer_personal_loans", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8mb3", force: :cascade do |t|
    t.string "full_name"
    t.string "mobile_number"
    t.string "email"
    t.integer "loan_purpose"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "custom_used_car_loans", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8mb3", force: :cascade do |t|
    t.string "full_name"
    t.string "mobile_number"
    t.string "email"
    t.integer "loan_purpose"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "degrees", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8mb3", force: :cascade do |t|
    t.integer "profession_id"
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "dependent_numbers", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8mb3", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "employers", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8mb3", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "employment_types", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8mb3", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "highest_qualifications", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8mb3", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "home_loan_amounts", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8mb3", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "home_loan_bank_infos", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8mb3", force: :cascade do |t|
    t.decimal "roi", precision: 20, scale: 2
    t.decimal "processing_fee", precision: 20, scale: 2
    t.text "preprocessing_charges"
    t.integer "home_loan_bank_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["home_loan_bank_id"], name: "index_home_loan_bank_infos_on_home_loan_bank_id"
  end

  create_table "home_loan_banks", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8mb3", force: :cascade do |t|
    t.string "name"
    t.string "slug"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "home_loan_tenures", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8mb3", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "home_loans", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8mb3", force: :cascade do |t|
    t.decimal "loan_amount", precision: 20, scale: 2
    t.integer "tenure"
    t.string "email"
    t.string "mobile_number"
    t.string "property_city"
    t.decimal "annual_income", precision: 20, scale: 2
    t.decimal "current_emi", precision: 20, scale: 2
    t.decimal "property_cost", precision: 20, scale: 2
    t.integer "employment_type"
    t.string "full_name"
    t.text "address"
    t.string "city"
    t.string "pincode"
    t.datetime "dob"
    t.integer "otp"
    t.boolean "otp_verified", default: false
    t.string "reference_number"
    t.boolean "terms_and_conditions"
    t.integer "home_loan_bank_id"
    t.string "status"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["home_loan_bank_id"], name: "index_home_loans_on_home_loan_bank_id"
  end

  create_table "industry_types", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8mb3", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "instant_calls", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8mb3", force: :cascade do |t|
    t.string "full_name"
    t.string "mobile_number"
    t.string "email"
    t.string "city"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "loan_against_properties", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8mb3", force: :cascade do |t|
    t.decimal "loan_amount", precision: 20, scale: 2
    t.integer "tenure"
    t.string "email"
    t.string "mobile_number"
    t.string "property_city"
    t.decimal "annual_income", precision: 20, scale: 2
    t.decimal "current_emi", precision: 20, scale: 2
    t.decimal "property_cost", precision: 20, scale: 2
    t.integer "employment_type"
    t.string "full_name"
    t.text "address"
    t.string "city"
    t.string "pincode"
    t.datetime "dob"
    t.integer "otp"
    t.boolean "otp_verified", default: false
    t.string "reference_number"
    t.boolean "terms_and_conditions"
    t.integer "loan_against_property_bank_id"
    t.string "status"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["loan_against_property_bank_id"], name: "index_loan_against_properties_on_loan_against_property_bank_id"
  end

  create_table "loan_against_property_bank_infos", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8mb3", force: :cascade do |t|
    t.decimal "roi", precision: 20, scale: 2
    t.decimal "processing_fee", precision: 20, scale: 2
    t.text "preprocessing_charges"
    t.integer "loan_against_property_bank_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["loan_against_property_bank_id"], name: "lapb_index"
  end

  create_table "loan_against_property_banks", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8mb3", force: :cascade do |t|
    t.string "name"
    t.string "slug"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "loan_purposes", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8mb3", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "mailing_addresses", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8mb3", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "new_car_loan_bank_infos", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8mb3", force: :cascade do |t|
    t.decimal "roi", precision: 20, scale: 2
    t.decimal "processing_fee", precision: 20, scale: 2
    t.text "preprocessing_charges"
    t.integer "new_car_loan_bank_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["new_car_loan_bank_id"], name: "index_new_car_loan_bank_infos_on_new_car_loan_bank_id"
  end

  create_table "new_car_loan_banks", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8mb3", force: :cascade do |t|
    t.string "name"
    t.string "slug"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "new_car_loans", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8mb3", force: :cascade do |t|
    t.decimal "loan_amount", precision: 20, scale: 2
    t.integer "tenure"
    t.string "email"
    t.string "mobile_number"
    t.string "full_name"
    t.integer "car_manufacturer"
    t.integer "car_model"
    t.integer "employment_type"
    t.decimal "current_emi", precision: 20, scale: 2
    t.text "address"
    t.string "city"
    t.string "pincode"
    t.text "office_address"
    t.string "office_city"
    t.string "office_pincode"
    t.datetime "dob"
    t.integer "otp"
    t.boolean "otp_verified", default: false
    t.string "reference_number"
    t.boolean "terms_and_conditions"
    t.integer "new_car_loan_bank_id"
    t.string "status"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["new_car_loan_bank_id"], name: "index_new_car_loans_on_new_car_loan_bank_id"
  end

  create_table "newsletter_subscriptions", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8mb3", force: :cascade do |t|
    t.string "email"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "personal_loan_bank_infos", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8mb3", force: :cascade do |t|
    t.decimal "roi", precision: 20, scale: 2
    t.decimal "processing_fee", precision: 20, scale: 2
    t.text "preprocessing_charges"
    t.integer "personal_loan_bank_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["personal_loan_bank_id"], name: "index_personal_loan_bank_infos_on_personal_loan_bank_id"
  end

  create_table "personal_loan_banks", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8mb3", force: :cascade do |t|
    t.string "name"
    t.string "slug"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "personal_loans", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8mb3", force: :cascade do |t|
    t.string "full_name"
    t.string "employer_name"
    t.integer "tenure"
    t.decimal "monthly_net_salary", precision: 20, scale: 2
    t.string "email"
    t.datetime "dob"
    t.text "address"
    t.string "city"
    t.string "pincode"
    t.text "office_address"
    t.string "office_city"
    t.string "office_pincode"
    t.decimal "loan_amount", precision: 20, scale: 2
    t.string "mobile_number"
    t.integer "otp"
    t.boolean "otp_verified", default: false
    t.string "reference_number"
    t.boolean "terms_and_conditions"
    t.integer "personal_loan_bank_id"
    t.integer "bank_name"
    t.decimal "current_emi", precision: 20, scale: 2
    t.boolean "existing_card", default: false
    t.string "status"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["personal_loan_bank_id"], name: "index_personal_loans_on_personal_loan_bank_id"
  end

  create_table "pre_approved_offers", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8mb3", force: :cascade do |t|
    t.string "first_name"
    t.string "last_name"
    t.string "mobile_no"
    t.string "reference_number"
    t.boolean "opt_status"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "professional_loan_bank_infos", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8mb3", force: :cascade do |t|
    t.decimal "roi", precision: 20, scale: 2
    t.decimal "processing_fee", precision: 20, scale: 2
    t.text "preprocessing_charges"
    t.integer "professional_loan_bank_id"
    t.integer "profession_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["profession_id"], name: "index_professional_loan_bank_infos_on_profession_id"
    t.index ["professional_loan_bank_id"], name: "index_professional_loan_bank_infos_on_professional_loan_bank_id"
  end

  create_table "professional_loan_banks", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8mb3", force: :cascade do |t|
    t.string "name"
    t.string "slug"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "professional_loans", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8mb3", force: :cascade do |t|
    t.decimal "loan_amount", precision: 20, scale: 2
    t.integer "tenure"
    t.string "email"
    t.string "mobile_number"
    t.string "full_name"
    t.integer "profession_type"
    t.integer "degree"
    t.integer "current_profession_since_year"
    t.decimal "annual_income", precision: 20, scale: 2
    t.integer "bank_name"
    t.decimal "current_emi", precision: 20, scale: 2
    t.text "address"
    t.string "city"
    t.string "pincode"
    t.text "office_address"
    t.string "office_city"
    t.string "office_pincode"
    t.datetime "dob"
    t.integer "otp"
    t.boolean "otp_verified", default: false
    t.string "reference_number"
    t.boolean "terms_and_conditions"
    t.integer "professional_loan_bank_id"
    t.string "status"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["professional_loan_bank_id"], name: "index_professional_loans_on_professional_loan_bank_id"
  end

  create_table "professions", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8mb3", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "qualifications", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8mb3", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "residence_types", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8mb3", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "roles", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8mb3", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "stay_city_since_years", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8mb3", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "stay_residence_since_years", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8mb3", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "tenures", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8mb3", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "transfer_home_loan_bank_infos", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8mb3", force: :cascade do |t|
    t.decimal "roi", precision: 20, scale: 2
    t.decimal "processing_fee", precision: 20, scale: 2
    t.text "preprocessing_charges"
    t.integer "transfer_home_loan_bank_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["transfer_home_loan_bank_id"], name: "tra_hm_ln_bank_id"
  end

  create_table "transfer_home_loan_banks", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8mb3", force: :cascade do |t|
    t.string "name"
    t.string "slug"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "transfer_home_loans", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8mb3", force: :cascade do |t|
    t.decimal "foreclose_loan_amount", precision: 20, scale: 2, default: "0.0"
    t.decimal "desired_loan_amount", precision: 20, scale: 2, default: "0.0"
    t.integer "tenure"
    t.string "email"
    t.string "mobile_number"
    t.string "property_city"
    t.decimal "annual_income", precision: 20, scale: 2
    t.decimal "current_emi", precision: 20, scale: 2
    t.decimal "property_cost", precision: 20, scale: 2
    t.integer "employment_type"
    t.string "full_name"
    t.text "address"
    t.string "city"
    t.string "pincode"
    t.datetime "dob"
    t.integer "otp"
    t.boolean "otp_verified", default: false
    t.string "reference_number"
    t.boolean "terms_and_conditions"
    t.integer "transfer_home_loan_bank_id"
    t.string "status"
    t.boolean "is_topup_amount", default: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["transfer_home_loan_bank_id"], name: "index_transfer_home_loans_on_transfer_home_loan_bank_id"
  end

  create_table "transfer_personal_loan_bank_infos", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8mb3", force: :cascade do |t|
    t.decimal "roi", precision: 20, scale: 2
    t.decimal "processing_fee", precision: 20, scale: 2
    t.text "preprocessing_charges"
    t.integer "transfer_personal_loan_bank_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["transfer_personal_loan_bank_id"], name: "tr_pl_loan_bank_id"
  end

  create_table "transfer_personal_loan_banks", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8mb3", force: :cascade do |t|
    t.string "name"
    t.string "slug"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "transfer_personal_loans", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8mb3", force: :cascade do |t|
    t.string "full_name"
    t.string "employer_name"
    t.integer "tenure"
    t.decimal "monthly_net_salary", precision: 20, scale: 2
    t.string "email"
    t.datetime "dob"
    t.text "address"
    t.string "city"
    t.string "pincode"
    t.text "office_address"
    t.string "office_city"
    t.string "office_pincode"
    t.decimal "foreclose_loan_amount", precision: 20, scale: 2, default: "0.0"
    t.decimal "desired_loan_amount", precision: 20, scale: 2, default: "0.0"
    t.string "mobile_number"
    t.integer "otp"
    t.boolean "otp_verified", default: false
    t.string "reference_number"
    t.boolean "terms_and_conditions"
    t.integer "transfer_personal_loan_bank_id"
    t.integer "bank_name"
    t.integer "existing_bank_name"
    t.decimal "existing_roi", precision: 20, scale: 2
    t.decimal "current_emi", precision: 20, scale: 2
    t.boolean "existing_card", default: false
    t.boolean "is_topup_amount", default: false
    t.string "status"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["transfer_personal_loan_bank_id"], name: "index_transfer_personal_loans_on_transfer_personal_loan_bank_id"
  end

  create_table "used_car_loan_bank_infos", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8mb3", force: :cascade do |t|
    t.decimal "roi", precision: 20, scale: 2
    t.decimal "processing_fee", precision: 20, scale: 2
    t.text "preprocessing_charges"
    t.integer "used_car_loan_bank_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["used_car_loan_bank_id"], name: "index_used_car_loan_bank_infos_on_used_car_loan_bank_id"
  end

  create_table "used_car_loan_banks", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8mb3", force: :cascade do |t|
    t.string "name"
    t.string "slug"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "used_car_loans", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8mb3", force: :cascade do |t|
    t.decimal "loan_amount", precision: 20, scale: 2
    t.integer "tenure"
    t.string "email"
    t.string "mobile_number"
    t.string "full_name"
    t.string "car_registration_number"
    t.string "model_year"
    t.integer "car_manufacturer"
    t.integer "car_model"
    t.integer "employment_type"
    t.decimal "current_emi", precision: 20, scale: 2
    t.text "address"
    t.string "city"
    t.string "pincode"
    t.text "office_address"
    t.string "office_city"
    t.string "office_pincode"
    t.datetime "dob"
    t.integer "otp"
    t.boolean "otp_verified", default: false
    t.string "reference_number"
    t.boolean "terms_and_conditions"
    t.integer "used_car_loan_bank_id"
    t.string "status"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["used_car_loan_bank_id"], name: "index_used_car_loans_on_used_car_loan_bank_id"
  end

  create_table "users", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8mb3", force: :cascade do |t|
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
