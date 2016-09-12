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

ActiveRecord::Schema.define(version: 20160830180625) do

  create_table "addresses", force: :cascade do |t|
    t.integer  "city_id",    limit: 4,   null: false
    t.string   "direccion",  limit: 100, null: false
    t.string   "calle",      limit: 100, null: false
    t.string   "barrio",     limit: 30,  null: false
    t.datetime "created_at",             null: false
    t.datetime "updated_at",             null: false
  end

  add_index "addresses", ["city_id"], name: "index_addresses_on_city_id", using: :btree

  create_table "addresses_people", id: false, force: :cascade do |t|
    t.integer "person_id",  limit: 4, null: false
    t.integer "address_id", limit: 4, null: false
  end

  add_index "addresses_people", ["address_id"], name: "index_people_addresses_on_address_id", using: :btree
  add_index "addresses_people", ["person_id"], name: "index_people_addresses_on_person_id", using: :btree

  create_table "addresses_settings", id: false, force: :cascade do |t|
    t.integer "setting_id", limit: 4, null: false
    t.integer "address_id", limit: 4, null: false
  end

  add_index "addresses_settings", ["address_id"], name: "index_addresses_settings_on_address_id", using: :btree
  add_index "addresses_settings", ["setting_id"], name: "index_addresses_settings_on_setting_id", using: :btree

  create_table "cities", force: :cascade do |t|
    t.string   "city",            limit: 30, null: false
    t.integer  "departamento_id", limit: 4,  null: false
    t.datetime "created_at",                 null: false
    t.datetime "updated_at",                 null: false
  end

  add_index "cities", ["departamento_id"], name: "index_cities_on_departamento_id", using: :btree

  create_table "countries", force: :cascade do |t|
    t.string   "country",    limit: 30, null: false
    t.datetime "created_at",            null: false
    t.datetime "updated_at",            null: false
  end

  create_table "departamentos", force: :cascade do |t|
    t.string   "departamento", limit: 30, null: false
    t.integer  "country_id",   limit: 4,  null: false
    t.datetime "created_at",              null: false
    t.datetime "updated_at",              null: false
  end

  add_index "departamentos", ["country_id"], name: "index_departamentos_on_country_id", using: :btree

  create_table "employees", force: :cascade do |t|
    t.integer  "person_id",     limit: 4
    t.date     "contract_date",             null: false
    t.string   "attachment",    limit: 255
    t.datetime "created_at",                null: false
    t.datetime "updated_at",                null: false
  end

  add_index "employees", ["person_id"], name: "index_employees_on_person_id", using: :btree

  create_table "employees_functions", force: :cascade do |t|
    t.integer "employee_id", limit: 4, null: false
    t.integer "function_id", limit: 4, null: false
  end

  add_index "employees_functions", ["employee_id"], name: "index_employees_functions_on_employee_id", using: :btree
  add_index "employees_functions", ["function_id"], name: "index_employees_functions_on_function_id", using: :btree

  create_table "functions", force: :cascade do |t|
    t.string   "function",    limit: 100, null: false
    t.string   "description", limit: 255
    t.datetime "created_at",              null: false
    t.datetime "updated_at",              null: false
  end

  create_table "people", force: :cascade do |t|
    t.string   "first_name", limit: 30, null: false
    t.string   "last_name",  limit: 30, null: false
    t.string   "doc",        limit: 15, null: false
    t.string   "phone",      limit: 15, null: false
    t.string   "sex",        limit: 30, null: false
    t.date     "birthdate"
    t.datetime "created_at",            null: false
    t.datetime "updated_at",            null: false
  end

  create_table "roles", force: :cascade do |t|
    t.string   "role",        limit: 100, null: false
    t.string   "description", limit: 255
    t.datetime "created_at",              null: false
    t.datetime "updated_at",              null: false
  end

  create_table "roles_users", id: false, force: :cascade do |t|
    t.integer "role_id", limit: 4, null: false
    t.integer "user_id", limit: 4, null: false
  end

  add_index "roles_users", ["role_id"], name: "index_roles_users_on_role_id", using: :btree
  add_index "roles_users", ["user_id"], name: "index_roles_users_on_user_id", using: :btree

  create_table "settings", force: :cascade do |t|
    t.string   "name",        limit: 255,   null: false
    t.string   "phone",       limit: 255
    t.string   "email",       limit: 255
    t.string   "ruc",         limit: 255
    t.text     "description", limit: 65535
    t.text     "historic",    limit: 65535
    t.string   "logo",        limit: 255,   null: false
    t.datetime "created_at",                null: false
    t.datetime "updated_at",                null: false
  end

  create_table "users", force: :cascade do |t|
    t.string   "email",                  limit: 255, default: "", null: false
    t.string   "encrypted_password",     limit: 255, default: "", null: false
    t.integer  "person_id",              limit: 4,                null: false
    t.string   "reset_password_token",   limit: 255
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          limit: 4,   default: 0,  null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip",     limit: 255
    t.string   "last_sign_in_ip",        limit: 255
    t.datetime "created_at",                                      null: false
    t.datetime "updated_at",                                      null: false
  end

  add_index "users", ["email"], name: "index_users_on_email", unique: true, using: :btree
  add_index "users", ["person_id"], name: "index_users_on_person_id", using: :btree
  add_index "users", ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true, using: :btree

  add_foreign_key "addresses", "cities"
  add_foreign_key "cities", "departamentos"
  add_foreign_key "departamentos", "countries"
  add_foreign_key "employees", "people"
end
