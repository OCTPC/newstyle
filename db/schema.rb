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

<<<<<<< HEAD
ActiveRecord::Schema.define(version: 20160901075633) do

  create_table "contents", force: :cascade do |t|
    t.text     "title"
    t.text     "url"
    t.text     "summary"
    t.text     "body"
    t.text     "keyword"
    t.text     "trend"
    t.datetime "time"
    t.text     "author"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end
=======
<<<<<<< HEAD
ActiveRecord::Schema.define(version: 0) do
=======
ActiveRecord::Schema.define(version: 20160901122056) do

  create_table "contents", force: :cascade do |t|
    t.string   "title"
    t.string   "url"
    t.text     "summary"
    t.text     "body"
    t.string   "trend"
    t.datetime "time"
    t.string   "author"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "relationships", force: :cascade do |t|
    t.integer  "a_id"
    t.integer  "b_id"
    t.float    "score"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end
>>>>>>> 9006c4ea0aaa405d924330f74a2170c18723ece7
>>>>>>> 8b90bb1d5b15edd7e4fb1e1d8785c142fcb30872

end