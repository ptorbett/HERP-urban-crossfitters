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

ActiveRecord::Schema.define(:version => 20120508020138) do

  create_table "exercise_types", :force => true do |t|
    t.string   "name",       :null => false
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "exercises", :force => true do |t|
    t.integer  "repetitions"
    t.integer  "weight"
    t.integer  "rounds"
    t.integer  "distance"
    t.string   "units"
    t.datetime "created_at",  :null => false
    t.datetime "updated_at",  :null => false
  end

  create_table "goals", :force => true do |t|
    t.string   "name",        :null => false
    t.text     "description", :null => false
    t.string   "status",      :null => false
    t.date     "deadline",    :null => false
    t.datetime "created_at",  :null => false
    t.datetime "updated_at",  :null => false
  end

  create_table "health_records", :force => true do |t|
    t.date     "date_recorded",      :null => false
    t.integer  "systolic_bp"
    t.integer  "diastolic_bp"
    t.integer  "weight"
    t.integer  "resting_heart_rate"
    t.integer  "calories_consumed"
    t.datetime "created_at",         :null => false
    t.datetime "updated_at",         :null => false
  end

  create_table "injury_records", :force => true do |t|
    t.string   "name",                        :null => false
    t.date     "start_date",                  :null => false
    t.date     "end_date"
    t.text     "description", :default => "", :null => false
    t.integer  "severity",                    :null => false
    t.datetime "created_at",                  :null => false
    t.datetime "updated_at",                  :null => false
  end

  create_table "personal_records", :force => true do |t|
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "profiles", :force => true do |t|
    t.string   "first_name",                  :null => false
    t.string   "last_name",                   :null => false
    t.integer  "height",                      :null => false
    t.integer  "weight",                      :null => false
    t.date     "birthdate",                   :null => false
    t.text     "description", :default => "", :null => false
    t.datetime "created_at",                  :null => false
    t.datetime "updated_at",                  :null => false
  end

  create_table "trainers", :force => true do |t|
    t.string   "name",       :null => false
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "users", :force => true do |t|
    t.string   "email",         :null => false
    t.string   "username",      :null => false
    t.string   "password_hash", :null => false
    t.string   "password_salt", :null => false
    t.datetime "created_at",    :null => false
    t.datetime "updated_at",    :null => false
  end

  create_table "workout_records", :force => true do |t|
    t.date     "date_performed",                 :null => false
    t.text     "note",           :default => ""
    t.integer  "points"
    t.integer  "time"
    t.integer  "rounds"
    t.datetime "created_at",                     :null => false
    t.datetime "updated_at",                     :null => false
  end

  create_table "workout_types", :force => true do |t|
    t.string   "type",       :null => false
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "workouts", :force => true do |t|
    t.string   "name",       :null => false
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

end
