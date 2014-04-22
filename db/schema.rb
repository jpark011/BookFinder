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

ActiveRecord::Schema.define(version: 20140411194435) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "books", force: true do |t|
    t.string   "title"
    t.string   "author"
    t.string   "publisher"
    t.string   "edition"
    t.decimal  "price",      precision: 6, scale: 2
    t.string   "required"
    t.string   "image"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "shelf_id"
  end

  create_table "books_courses", force: true do |t|
    t.integer "course_id"
    t.integer "book_id"
  end

  create_table "courses", force: true do |t|
    t.string   "subject"
    t.string   "number"
    t.string   "section"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "courses", ["subject"], name: "index_courses_on_subject", using: :btree

  create_table "courses_students", force: true do |t|
    t.integer "course_id"
    t.integer "student_id"
  end

  create_table "shelves", force: true do |t|
    t.string   "floor"
    t.string   "subject"
    t.string   "section"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "shelf_number"
    t.float    "x"
    t.float    "y"
  end

  create_table "students", force: true do |t|
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "first_name"
    t.string   "last_name"
    t.string   "year"
    t.string   "term"
    t.string   "user_id"
    t.string   "password"
    t.string   "role"
  end

end
