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

ActiveRecord::Schema.define(version: 20150908133020) do

  create_table "calenders", force: true do |t|
    t.integer  "month"
    t.integer  "year"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "days", force: true do |t|
    t.integer  "name"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "calender_id"
  end

  create_table "users", force: true do |t|
    t.string   "name"
    t.string   "password"
    t.datetime "hour"
    t.string   "week"
    t.string   "string"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "work_days", force: true do |t|
    t.time     "in_hour"
    t.time     "out_hour"
    t.integer  "weekend"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

end