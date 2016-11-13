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

ActiveRecord::Schema.define(version: 20161113140855) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "disciplines", force: :cascade do |t|
    t.string   "dis_name"
    t.integer  "dis_module"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "link_specialty_disciplines", force: :cascade do |t|
    t.integer  "specialty_id"
    t.integer  "discipline_id"
    t.integer  "term"
    t.integer  "report"
    t.datetime "created_at",    null: false
    t.datetime "updated_at",    null: false
    t.index ["discipline_id"], name: "index_link_specialty_disciplines_on_discipline_id", using: :btree
    t.index ["specialty_id"], name: "index_link_specialty_disciplines_on_specialty_id", using: :btree
  end

  create_table "specialties", force: :cascade do |t|
    t.integer  "spec_id"
    t.string   "spec_name"
    t.integer  "spec_type"
    t.integer  "spec_mode"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_foreign_key "link_specialty_disciplines", "disciplines"
  add_foreign_key "link_specialty_disciplines", "specialties"
end
