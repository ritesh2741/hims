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

ActiveRecord::Schema.define(version: 20150622140927) do

  create_table "appointments", force: :cascade do |t|
    t.date     "schedule"
    t.integer  "room"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer  "patient_id"
    t.integer  "doctor_id"
  end

  create_table "departments", force: :cascade do |t|
    t.text     "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

# Could not dump table "doctors" because of following NoMethodError
#   undefined method `[]' for nil:NilClass

# Could not dump table "patients" because of following NoMethodError
#   undefined method `[]' for nil:NilClass

  create_table "reports", force: :cascade do |t|
    t.text     "detail"
    t.text     "prescription"
    t.datetime "created_at",   null: false
    t.datetime "updated_at",   null: false
    t.integer  "patient_id"
    t.integer  "doctor_id"
    t.string   "title"
  end

end
