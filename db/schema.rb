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

ActiveRecord::Schema.define(version: 20180328172013) do

  create_table "microposts", force: :cascade do |t|
    t.string "content"
    t.integer "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["user_id", "created_at"], name: "index_microposts_on_user_id_and_created_at"
  end

  create_table "relationships", force: :cascade do |t|
    t.integer "follower_id"
    t.integer "followed_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["followed_id"], name: "index_relationships_on_followed_id"
    t.index ["follower_id", "followed_id"], name: "index_relationships_on_follower_id_and_followed_id", unique: true
    t.index ["follower_id"], name: "index_relationships_on_follower_id"
  end

  create_table "schedules", force: :cascade do |t|
    t.string "depart_city"
    t.string "final_city"
    t.integer "via_city_number"
    t.date "depart_date"
    t.date "final_date"
    t.integer "user_id"
    t.integer "status"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "dept_airport", default: ""
    t.string "arv_airport", default: ""
    t.string "isstop", default: "0"
    t.string "flight_day", default: "0"
    t.float "ontime_rate", default: 55.0
    t.string "seat_type", default: "经济舱"
    t.time "earliest_dept_time", default: "2000-01-01 00:00:01"
    t.time "latest_arv_time", default: "2000-01-01 23:59:59"
    t.integer "hotel_star", default: 3
    t.string "hotel_type", default: "经济型"
    t.integer "lowest_price", default: 70
    t.integer "highest_price", default: 100
    t.float "hotel_score", default: 4.2
    t.float "user_recommend", default: 0.9
    t.integer "user_number", default: 20
    t.index ["user_id", "created_at"], name: "index_schedules_on_user_id_and_created_at"
  end

  create_table "users", force: :cascade do |t|
    t.string "name"
    t.string "email"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "password_digest"
    t.string "remember_token"
    t.boolean "admin", default: false
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["remember_token"], name: "index_users_on_remember_token"
  end

  create_table "via_city_names", force: :cascade do |t|
    t.string "city_name"
    t.integer "user_id"
    t.integer "schedule_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "stay_days", default: 2
  end

end
