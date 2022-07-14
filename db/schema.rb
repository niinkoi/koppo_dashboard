# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# This file is the source Rails uses to define your schema when running `bin/rails
# db:schema:load`. When creating a new database, `bin/rails db:schema:load` tends to
# be faster and is potentially less error prone than running all of your
# migrations from scratch. Old migrations may fail to apply correctly if those
# migrations use external dependencies or application code.
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema[7.0].define(version: 2022_06_21_101004) do
  create_table "location_details", charset: "utf8mb4", collation: "utf8mb4_0900_ai_ci", force: :cascade do |t|
    t.string "location_city"
    t.string "location_district"
    t.string "location_ward"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "storefronts", charset: "utf8mb4", collation: "utf8mb4_0900_ai_ci", force: :cascade do |t|
    t.string "storefront_code"
    t.string "storefront_name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "location_detail_id", null: false
    t.index ["location_detail_id"], name: "index_storefronts_on_location_detail_id"
    t.index ["storefront_code"], name: "index_storefront_on_storefront_code", unique: true
  end

  create_table "users", charset: "utf8mb4", collation: "utf8mb4_0900_ai_ci", force: :cascade do |t|
    t.string "first_name"
    t.string "last_name"
    t.string "username"
    t.string "email"
    t.string "password_digest"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_foreign_key "storefronts", "location_details"
end
