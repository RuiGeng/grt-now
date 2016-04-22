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

ActiveRecord::Schema.define(version: 20160420233706) do

  create_table "users", force: :cascade do |t|
    t.string   "provider",               limit: 255,   default: "email", null: false
    t.string   "uid",                    limit: 255,   default: "",      null: false
    t.string   "encrypted_password",     limit: 255,   default: "",      null: false
    t.string   "reset_password_token",   limit: 255
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          limit: 4,     default: 0,       null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip",     limit: 255
    t.string   "last_sign_in_ip",        limit: 255
    t.string   "confirmation_token",     limit: 255
    t.datetime "confirmed_at"
    t.datetime "confirmation_sent_at"
    t.string   "unconfirmed_email",      limit: 255
    t.string   "name",                   limit: 255
    t.string   "nickname",               limit: 255
    t.string   "image",                  limit: 255
    t.string   "email",                  limit: 255
    t.text     "tokens",                 limit: 65535
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "users", ["email"], name: "index_users_on_email", using: :btree
  add_index "users", ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true, using: :btree
  add_index "users", ["uid", "provider"], name: "index_users_on_uid_and_provider", unique: true, using: :btree

  create_table "vehicle_realtimes", force: :cascade do |t|
    t.integer  "vehicle_trip_id",  limit: 4
    t.integer  "vehicle_route_id", limit: 4
    t.integer  "vehicle_stop_id",  limit: 4
    t.integer  "current_status",   limit: 4
    t.string   "lat",              limit: 255
    t.string   "long",             limit: 255
    t.datetime "created_at",                   null: false
    t.datetime "updated_at",                   null: false
  end

  add_index "vehicle_realtimes", ["vehicle_route_id"], name: "index_vehicle_realtimes_on_vehicle_route_id", using: :btree
  add_index "vehicle_realtimes", ["vehicle_stop_id"], name: "index_vehicle_realtimes_on_vehicle_stop_id", using: :btree
  add_index "vehicle_realtimes", ["vehicle_trip_id"], name: "index_vehicle_realtimes_on_vehicle_trip_id", using: :btree

  create_table "vehicle_routes", force: :cascade do |t|
    t.string   "long_name",  limit: 255
    t.datetime "created_at",             null: false
    t.datetime "updated_at",             null: false
  end

  create_table "vehicle_stop_times", force: :cascade do |t|
    t.string   "departure_time",  limit: 255
    t.integer  "vehicle_stop_id", limit: 4
    t.integer  "vehicle_trip_id", limit: 4
    t.integer  "sequence",        limit: 4
    t.datetime "created_at",                  null: false
    t.datetime "updated_at",                  null: false
  end

  add_index "vehicle_stop_times", ["vehicle_stop_id"], name: "index_vehicle_stop_times_on_vehicle_stop_id", using: :btree
  add_index "vehicle_stop_times", ["vehicle_trip_id"], name: "index_vehicle_stop_times_on_vehicle_trip_id", using: :btree

  create_table "vehicle_stops", force: :cascade do |t|
    t.string   "name",       limit: 255
    t.string   "lat",        limit: 255
    t.string   "long",       limit: 255
    t.datetime "created_at",             null: false
    t.datetime "updated_at",             null: false
  end

  create_table "vehicle_trips", force: :cascade do |t|
    t.integer  "vehicle_route_id", limit: 4
    t.string   "service",          limit: 255
    t.string   "name",             limit: 255
    t.integer  "direction",        limit: 4
    t.datetime "created_at",                   null: false
    t.datetime "updated_at",                   null: false
  end

  add_index "vehicle_trips", ["vehicle_route_id"], name: "index_vehicle_trips_on_vehicle_route_id", using: :btree

  add_foreign_key "vehicle_realtimes", "vehicle_routes"
  add_foreign_key "vehicle_realtimes", "vehicle_stops"
  add_foreign_key "vehicle_realtimes", "vehicle_trips"
  add_foreign_key "vehicle_stop_times", "vehicle_stops"
  add_foreign_key "vehicle_stop_times", "vehicle_trips"
  add_foreign_key "vehicle_trips", "vehicle_routes"
end
