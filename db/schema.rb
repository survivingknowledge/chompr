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

ActiveRecord::Schema.define(version: 20170615212648) do

  create_table "foods", force: :cascade do |t|
    t.string "name"
    t.string "serving_type", default: "g"
    t.integer "serving_size", default: 0
    t.integer "calories"
    t.float "total_fat"
    t.float "saturated_fat"
    t.float "trans_fat"
    t.float "cholesterol"
    t.integer "sodium"
    t.float "total_carbohydrate"
    t.integer "dietary_fiber"
    t.integer "sugars"
    t.float "protein"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "foods_meals", id: false, force: :cascade do |t|
    t.integer "meal_id"
    t.integer "food_id"
  end

  create_table "meals", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

end
