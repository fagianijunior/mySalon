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

ActiveRecord::Schema.define(version: 20180116032329) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "addresses", force: :cascade do |t|
    t.bigint "user_id"
    t.string "zipcode"
    t.bigint "state_id"
    t.bigint "city_id"
    t.bigint "district_id"
    t.string "street"
    t.string "number"
    t.string "complement"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["city_id"], name: "index_addresses_on_city_id"
    t.index ["district_id"], name: "index_addresses_on_district_id"
    t.index ["state_id"], name: "index_addresses_on_state_id"
    t.index ["user_id"], name: "index_addresses_on_user_id"
  end

  create_table "categories", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "cities", force: :cascade do |t|
    t.string "name"
    t.bigint "state_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["state_id"], name: "index_cities_on_state_id"
  end

  create_table "districts", force: :cascade do |t|
    t.string "name"
    t.bigint "city_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["city_id"], name: "index_districts_on_city_id"
  end

  create_table "employee_salons", force: :cascade do |t|
    t.bigint "employee_id"
    t.bigint "salon_id"
    t.time "start_of_expedient"
    t.time "start_lunch_time"
    t.time "end_lunch_time"
    t.time "end_of_expedient"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["employee_id"], name: "index_employee_salons_on_employee_id"
    t.index ["salon_id"], name: "index_employee_salons_on_salon_id"
  end

  create_table "employee_salons_weekdays", id: false, force: :cascade do |t|
    t.bigint "employee_salon_id", null: false
    t.bigint "weekday_id", null: false
  end

  create_table "employee_services", force: :cascade do |t|
    t.bigint "employee_id"
    t.bigint "service_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["employee_id"], name: "index_employee_services_on_employee_id"
    t.index ["service_id"], name: "index_employee_services_on_service_id"
  end

  create_table "employees", force: :cascade do |t|
    t.bigint "user_id"
    t.string "nis"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["user_id"], name: "index_employees_on_user_id"
  end

  create_table "genders", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["name"], name: "index_genders_on_name", unique: true
  end

  create_table "hair_sizes", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "phones", force: :cascade do |t|
    t.bigint "user_id"
    t.string "number"
    t.boolean "telegram", default: false
    t.boolean "whatsapp", default: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["user_id"], name: "index_phones_on_user_id"
  end

  create_table "salon_phones", force: :cascade do |t|
    t.bigint "salon_id"
    t.string "number"
    t.boolean "telegram"
    t.boolean "whatsapp"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["salon_id"], name: "index_salon_phones_on_salon_id"
  end

  create_table "salons", force: :cascade do |t|
    t.string "name"
    t.string "zipcode"
    t.bigint "state_id"
    t.bigint "city_id"
    t.bigint "district_id"
    t.string "street"
    t.string "number"
    t.string "complement"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["city_id"], name: "index_salons_on_city_id"
    t.index ["district_id"], name: "index_salons_on_district_id"
    t.index ["state_id"], name: "index_salons_on_state_id"
  end

  create_table "services", force: :cascade do |t|
    t.string "name"
    t.bigint "category_id"
    t.bigint "gender_id"
    t.bigint "hair_size_id"
    t.time "minimum_time"
    t.time "maximum_time"
    t.decimal "price"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["category_id"], name: "index_services_on_category_id"
    t.index ["gender_id"], name: "index_services_on_gender_id"
    t.index ["hair_size_id"], name: "index_services_on_hair_size_id"
  end

  create_table "states", force: :cascade do |t|
    t.string "name"
    t.string "abbreviation"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "users", force: :cascade do |t|
    t.string "name"
    t.bigint "gender_id"
    t.datetime "birth_date"
    t.string "cpf"
    t.string "rg"
    t.boolean "ghost_role", default: false
    t.boolean "admin_role", default: false
    t.boolean "user_role", default: true
    t.boolean "active", default: true
    t.text "notes"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer "sign_in_count", default: 0, null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string "current_sign_in_ip"
    t.string "last_sign_in_ip"
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["gender_id"], name: "index_users_on_gender_id"
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  create_table "version_associations", force: :cascade do |t|
    t.integer "version_id"
    t.string "foreign_key_name", null: false
    t.integer "foreign_key_id"
    t.index ["foreign_key_name", "foreign_key_id"], name: "index_version_associations_on_foreign_key"
    t.index ["version_id"], name: "index_version_associations_on_version_id"
  end

  create_table "versions", force: :cascade do |t|
    t.string "item_type", null: false
    t.integer "item_id", null: false
    t.string "event", null: false
    t.string "whodunnit"
    t.text "object"
    t.datetime "created_at"
    t.text "object_changes"
    t.integer "transaction_id"
    t.index ["item_type", "item_id"], name: "index_versions_on_item_type_and_item_id"
    t.index ["transaction_id"], name: "index_versions_on_transaction_id"
  end

  create_table "weekdays", force: :cascade do |t|
    t.string "name"
    t.string "abbreviation"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_foreign_key "addresses", "cities"
  add_foreign_key "addresses", "districts"
  add_foreign_key "addresses", "states"
  add_foreign_key "addresses", "users"
  add_foreign_key "cities", "states"
  add_foreign_key "districts", "cities"
  add_foreign_key "employee_salons", "employees"
  add_foreign_key "employee_salons", "salons"
  add_foreign_key "employee_services", "employees"
  add_foreign_key "employee_services", "services"
  add_foreign_key "employees", "users"
  add_foreign_key "phones", "users"
  add_foreign_key "salon_phones", "salons"
  add_foreign_key "salons", "cities"
  add_foreign_key "salons", "districts"
  add_foreign_key "salons", "states"
  add_foreign_key "services", "categories"
  add_foreign_key "services", "genders"
  add_foreign_key "services", "hair_sizes"
  add_foreign_key "users", "genders"
end
