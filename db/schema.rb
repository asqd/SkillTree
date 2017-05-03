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

ActiveRecord::Schema.define(version: 20170504205255) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "departments", force: :cascade do |t|
    t.string   "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "departments_saes", force: :cascade do |t|
    t.integer  "department_id"
    t.integer  "sae_id"
    t.datetime "created_at",    null: false
    t.datetime "updated_at",    null: false
    t.index ["department_id"], name: "index_departments_saes_on_department_id", using: :btree
    t.index ["sae_id"], name: "index_departments_saes_on_sae_id", using: :btree
  end

  create_table "disciplines", force: :cascade do |t|
    t.string   "name"
    t.string   "label"
    t.datetime "created_at",    null: false
    t.datetime "updated_at",    null: false
    t.float    "zet"
    t.boolean  "practice?"
    t.integer  "department_id"
    t.string   "human_label"
  end

  create_table "link_specialty_disciplines", force: :cascade do |t|
    t.integer  "term"
    t.integer  "htype"
    t.string   "human_htype"
    t.integer  "specialty_id"
    t.integer  "discipline_id"
    t.datetime "created_at",        null: false
    t.datetime "updated_at",        null: false
    t.integer  "hours"
    t.string   "human_short_htype"
    t.integer  "term_number"
    t.index ["discipline_id"], name: "index_link_specialty_disciplines_on_discipline_id", using: :btree
    t.index ["specialty_id"], name: "index_link_specialty_disciplines_on_specialty_id", using: :btree
  end

  create_table "saes", force: :cascade do |t|
    t.string   "short_name"
    t.string   "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "specialties", force: :cascade do |t|
    t.integer  "dtype"
    t.string   "human_dtype"
    t.string   "direction"
    t.integer  "level"
    t.string   "human_level"
    t.integer  "study_form"
    t.string   "human_study_form"
    t.datetime "created_at",       null: false
    t.datetime "updated_at",       null: false
    t.string   "full_direction"
    t.string   "code"
    t.string   "profile"
    t.string   "qualification"
    t.integer  "department_id"
    t.integer  "sae_id"
  end

  create_table "users", force: :cascade do |t|
    t.string   "first_name"
    t.string   "last_name"
    t.string   "profile_name"
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
    t.index ["email"], name: "index_users_on_email", unique: true, using: :btree
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true, using: :btree
  end

  add_foreign_key "link_specialty_disciplines", "disciplines"
  add_foreign_key "link_specialty_disciplines", "specialties"
end
