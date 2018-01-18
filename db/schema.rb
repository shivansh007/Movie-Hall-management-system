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

ActiveRecord::Schema.define(version: 20180118050308) do

  create_table "audis", force: :cascade do |t|
    t.integer  "movie_hall_id", limit: 4
    t.integer  "audi_no",       limit: 4
    t.datetime "created_at",              null: false
    t.datetime "updated_at",              null: false
  end

  add_index "audis", ["movie_hall_id"], name: "index_audis_on_movie_hall_id", using: :btree

  create_table "bookings", force: :cascade do |t|
    t.integer  "movie_id",     limit: 4
    t.integer  "user_id",      limit: 4
    t.time     "booking_time"
    t.datetime "created_at",             null: false
    t.datetime "updated_at",             null: false
  end

  add_index "bookings", ["movie_id"], name: "index_bookings_on_movie_id", using: :btree
  add_index "bookings", ["user_id"], name: "index_bookings_on_user_id", using: :btree

  create_table "movie_halls", force: :cascade do |t|
    t.string   "name",       limit: 255
    t.string   "address",    limit: 255
    t.string   "phone",      limit: 255
    t.datetime "created_at",             null: false
    t.datetime "updated_at",             null: false
  end

  create_table "movies", force: :cascade do |t|
    t.string   "name",         limit: 255
    t.date     "release_date"
    t.string   "cast",         limit: 255
    t.datetime "created_at",               null: false
    t.datetime "updated_at",               null: false
  end

  create_table "seats", force: :cascade do |t|
    t.integer  "audi_id",     limit: 4
    t.string   "row_number",  limit: 255
    t.integer  "seat_number", limit: 4
    t.datetime "created_at",              null: false
    t.datetime "updated_at",              null: false
  end

  add_index "seats", ["audi_id"], name: "index_seats_on_audi_id", using: :btree

  create_table "show_times", force: :cascade do |t|
    t.integer  "movie_id",   limit: 4
    t.integer  "audi_id",    limit: 4
    t.time     "start_time"
    t.time     "run_time"
    t.datetime "created_at",           null: false
    t.datetime "updated_at",           null: false
  end

  add_index "show_times", ["movie_id"], name: "index_show_times_on_movie_id", using: :btree

  create_table "tickets", force: :cascade do |t|
    t.integer  "booking_id",   limit: 4
    t.integer  "show_time_id", limit: 4
    t.integer  "seat_id",      limit: 4
    t.datetime "created_at",             null: false
    t.datetime "updated_at",             null: false
  end

  add_index "tickets", ["booking_id"], name: "index_tickets_on_booking_id", using: :btree
  add_index "tickets", ["seat_id"], name: "index_tickets_on_seat_id", using: :btree
  add_index "tickets", ["show_time_id"], name: "index_tickets_on_show_time_id", using: :btree

  create_table "users", force: :cascade do |t|
    t.string   "name",       limit: 255
    t.string   "email",      limit: 255
    t.string   "phone",      limit: 255
    t.datetime "created_at",             null: false
    t.datetime "updated_at",             null: false
  end

  add_foreign_key "audis", "movie_halls"
  add_foreign_key "bookings", "movies"
  add_foreign_key "bookings", "users"
  add_foreign_key "seats", "audis"
  add_foreign_key "show_times", "movies"
  add_foreign_key "tickets", "bookings"
  add_foreign_key "tickets", "seats"
  add_foreign_key "tickets", "show_times"
end
