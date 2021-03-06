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

ActiveRecord::Schema.define(version: 2018_11_05_035248) do

  create_table "drug_mortality2014s", force: :cascade do |t|
    t.integer "state_id"
    t.integer "deaths"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["state_id"], name: "index_drug_mortality2014s_on_state_id"
  end

  create_table "drug_mortality2015s", force: :cascade do |t|
    t.integer "state_id"
    t.integer "deaths"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["state_id"], name: "index_drug_mortality2015s_on_state_id"
  end

  create_table "drug_mortality2016s", force: :cascade do |t|
    t.integer "state_id"
    t.integer "deaths"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["state_id"], name: "index_drug_mortality2016s_on_state_id"
  end

  create_table "flu_mortality2014s", force: :cascade do |t|
    t.integer "state_id"
    t.integer "deaths"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["state_id"], name: "index_flu_mortality2014s_on_state_id"
  end

  create_table "flu_mortality2015s", force: :cascade do |t|
    t.integer "state_id"
    t.integer "deaths"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["state_id"], name: "index_flu_mortality2015s_on_state_id"
  end

  create_table "flu_mortality2016s", force: :cascade do |t|
    t.integer "state_id"
    t.integer "deaths"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["state_id"], name: "index_flu_mortality2016s_on_state_id"
  end

  create_table "state_populations", force: :cascade do |t|
    t.integer "year_2014"
    t.integer "year_2015"
    t.integer "year_2016"
    t.integer "state_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["state_id"], name: "index_state_populations_on_state_id"
  end

  create_table "states", force: :cascade do |t|
    t.string "state"
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

end
