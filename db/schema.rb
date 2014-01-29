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
# It's strongly recommended to check this file into your version control system.

ActiveRecord::Schema.define(:version => 20140129020235) do

  create_table "batteries", :force => true do |t|
    t.string   "code"
    t.date     "new_date"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
    t.integer  "company_id"
  end

  add_index "batteries", ["company_id"], :name => "index_batteries_on_company_id"

  create_table "batterycharges", :force => true do |t|
    t.date     "date"
    t.string   "status"
    t.string   "start_voltage_decimal"
    t.decimal  "end_voltage"
    t.decimal  "end_percentage"
    t.integer  "battery_id"
    t.datetime "created_at",            :null => false
    t.datetime "updated_at",            :null => false
    t.integer  "company_id"
  end

  add_index "batterycharges", ["battery_id"], :name => "index_batterycharges_on_battery_id"
  add_index "batterycharges", ["company_id"], :name => "index_batterycharges_on_company_id"

  create_table "batteryuses", :force => true do |t|
    t.date     "date"
    t.decimal  "flight_time"
    t.integer  "battery_id"
    t.integer  "flight_id"
    t.datetime "created_at",  :null => false
    t.datetime "updated_at",  :null => false
  end

  add_index "batteryuses", ["battery_id"], :name => "index_batteryuses_on_battery_id"
  add_index "batteryuses", ["flight_id"], :name => "index_batteryuses_on_flight_id"

  create_table "companies", :force => true do |t|
    t.string   "name"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
    t.string   "image"
  end

  create_table "fitness_for_works", :force => true do |t|
    t.boolean  "q1"
    t.boolean  "q2"
    t.boolean  "q3"
    t.boolean  "q4"
    t.boolean  "q5"
    t.boolean  "q6"
    t.boolean  "q7"
    t.boolean  "q8"
    t.boolean  "q9"
    t.boolean  "q10"
    t.boolean  "q11"
    t.boolean  "q12"
    t.boolean  "q13"
    t.boolean  "q14"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "flight_platforms", :force => true do |t|
    t.string   "name"
    t.integer  "company_code"
    t.datetime "created_at",    :null => false
    t.datetime "updated_at",    :null => false
    t.integer  "company_id"
    t.string   "platform_type"
  end

  add_index "flight_platforms", ["company_id"], :name => "index_flight_platforms_on_company_id"

  create_table "flights", :force => true do |t|
    t.decimal  "battery_start_reading"
    t.time     "spin_up_time"
    t.time     "spin_down_time"
    t.integer  "battery_id"
    t.integer  "session_id"
    t.datetime "created_at",            :null => false
    t.datetime "updated_at",            :null => false
    t.decimal  "total_flight_time"
    t.boolean  "fullbatteryused"
    t.boolean  "isincident"
    t.decimal  "windspeed"
  end

  add_index "flights", ["battery_id"], :name => "index_flights_on_battery_id"
  add_index "flights", ["session_id"], :name => "index_flights_on_session_id"

  create_table "incidents", :force => true do |t|
    t.date     "report_date"
    t.string   "reporter_name"
    t.boolean  "personal_injury"
    t.boolean  "equipment_damage"
    t.boolean  "thirdparty_damage"
    t.string   "witness_names"
    t.time     "incident_time"
    t.boolean  "casa_notified"
    t.boolean  "chief_pilot_notified"
    t.boolean  "management_notified"
    t.boolean  "atrb_notified"
    t.boolean  "worksafe_notified"
    t.boolean  "insurance_notified"
    t.text     "description"
    t.text     "consequences"
    t.text     "action_taken"
    t.datetime "created_at",           :null => false
    t.datetime "updated_at",           :null => false
    t.integer  "flight_id"
    t.date     "date"
    t.string   "location"
    t.date     "incident_date"
    t.integer  "company_id"
  end

  add_index "incidents", ["company_id"], :name => "index_incidents_on_company_id"

  create_table "pilot_fitness_files", :force => true do |t|
    t.boolean  "q1"
    t.boolean  "q2"
    t.boolean  "q3"
    t.boolean  "q4"
    t.boolean  "q5"
    t.boolean  "q6"
    t.boolean  "q7"
    t.boolean  "q8"
    t.boolean  "q9"
    t.boolean  "q10"
    t.boolean  "q11"
    t.boolean  "q12"
    t.boolean  "q13"
    t.boolean  "q14"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
    t.integer  "pilot_id"
    t.date     "date"
    t.boolean  "pass"
    t.integer  "company_id"
  end

  add_index "pilot_fitness_files", ["company_id"], :name => "index_pilot_fitness_files_on_company_id"

  create_table "pilots", :force => true do |t|
    t.string   "first_name"
    t.string   "last_name"
    t.string   "arn"
    t.boolean  "uav_certified"
    t.datetime "created_at",    :null => false
    t.datetime "updated_at",    :null => false
    t.integer  "company_id"
  end

  add_index "pilots", ["company_id"], :name => "index_pilots_on_company_id"

  create_table "platform_batteries", :force => true do |t|
    t.integer  "flight_platform_id"
    t.integer  "battery_id"
    t.datetime "created_at",         :null => false
    t.datetime "updated_at",         :null => false
  end

  add_index "platform_batteries", ["battery_id"], :name => "index_platform_batteries_on_battery_id"
  add_index "platform_batteries", ["flight_platform_id"], :name => "index_platform_batteries_on_flight_platform_id"

  create_table "sessions", :force => true do |t|
    t.date     "date"
    t.string   "location"
    t.string   "client"
    t.text     "task"
    t.string   "weather"
    t.integer  "windspeed"
    t.integer  "remote_pilot_id"
    t.string   "remote_pilot_type"
    t.integer  "chief_pilot_id"
    t.string   "chief_pilot_type"
    t.string   "observer"
    t.string   "payload"
    t.string   "gcs_deployment"
    t.string   "gcs_control"
    t.time     "jsa_time"
    t.time     "pre_flight_time"
    t.time     "mission_briefing_time"
    t.datetime "created_at",            :null => false
    t.datetime "updated_at",            :null => false
    t.float    "latitude"
    t.float    "longitude"
    t.string   "address"
    t.integer  "company_id"
    t.integer  "flight_platform_id"
  end

  add_index "sessions", ["company_id"], :name => "index_sessions_on_company_id"
  add_index "sessions", ["flight_platform_id"], :name => "index_sessions_on_flight_platform_id"

  create_table "user_sessions", :force => true do |t|
    t.string   "email"
    t.string   "password"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "users", :force => true do |t|
    t.string   "firstname"
    t.string   "lastname"
    t.string   "email"
    t.string   "crypted_password"
    t.string   "password_salt"
    t.string   "persistence_token"
    t.boolean  "admin"
    t.datetime "created_at",        :null => false
    t.datetime "updated_at",        :null => false
    t.integer  "company_id"
  end

  add_index "users", ["company_id"], :name => "index_users_on_company_id"

end
