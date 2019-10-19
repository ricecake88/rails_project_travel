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

ActiveRecord::Schema.define(version: 2019_10_17_034507) do

  create_table "attractions", force: :cascade do |t|
    t.integer "place_id"
    t.string "name"
    t.integer "admission"
    t.string "webpage"
    t.text "description"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "itinerary_items", force: :cascade do |t|
    t.integer "leg_id"
    t.integer "day_of_trip"
    t.datetime "time"
    t.string "type_of_activity"
    t.integer "attraction_id"
    t.string "mode_of_transport"
    t.datetime "transport_departure_time"
    t.datetime "transport_arrival_time"
    t.text "notes"
    t.integer "activity_order"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "legs", force: :cascade do |t|
    t.integer "vacation_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "arrival_place_id"
    t.integer "departure_place_id"
    t.integer "leg_num"
  end

  create_table "places", force: :cascade do |t|
    t.string "country_name"
    t.string "country_code"
    t.string "state_name"
    t.string "state_code"
    t.string "city_name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "users", force: :cascade do |t|
    t.string "first_name"
    t.string "last_name"
    t.integer "place_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.string "google_token"
    t.string "google_refresh_token"
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  create_table "vacation_places", force: :cascade do |t|
    t.integer "vacation_id"
    t.integer "place_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "quantity"
  end

  create_table "vacations", force: :cascade do |t|
    t.string "name"
    t.integer "user_id"
    t.datetime "start_date"
    t.datetime "end_date"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

end
