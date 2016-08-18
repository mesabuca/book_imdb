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

<<<<<<< HEAD
ActiveRecord::Schema.define(version: 20160818080146) do
=======
ActiveRecord::Schema.define(version: 20160818080406) do
>>>>>>> 2644d078e46b987e9b33aad3146e127a755c5f04

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "authors", force: :cascade do |t|
    t.string   "first_name"
    t.string   "last_name"
    t.text     "biography"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

<<<<<<< HEAD
  create_table "votes", force: :cascade do |t|
    t.integer  "point"
=======
  create_table "books", force: :cascade do |t|
    t.string   "name"
    t.string   "publisher"
>>>>>>> 2644d078e46b987e9b33aad3146e127a755c5f04
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

end
