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

ActiveRecord::Schema.define(version: 20171115205756) do

  create_table "bikes", force: :cascade do |t|
    t.integer "city_bike_id"
  end

  create_table "stations", force: :cascade do |t|
    t.integer "city_station_id"
    t.string  "name"
    t.float   "latitude"
    t.float   "longitude"
  end

  create_table "trips", force: :cascade do |t|
    t.integer  "duration"
    t.datetime "start_time"
    t.datetime "end_time"
    t.integer  "start_station_id"
    t.integer  "end_station_id"
    t.integer  "city_bike_id"
    t.string   "user_type"
    t.integer  "birth_year"
    t.integer  "gender"
    t.string   "unique_trip_id"
  end

end
