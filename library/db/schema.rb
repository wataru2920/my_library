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

ActiveRecord::Schema.define(version: 2022_11_05_045911) do

  create_table "books", force: :cascade do |t|
    t.string "isbn"
    t.string "title"
    t.integer "price"
    t.string "publish"
    t.date "published"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "hold"
  end

  create_table "reserves", force: :cascade do |t|
    t.integer "book_id"
    t.integer "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "flag"
  end

  create_table "users", force: :cascade do |t|
    t.string "username"
    t.string "email"
    t.string "post_code"
    t.text "address"
    t.string "phone_number"
    t.string "sex"
    t.date "birthday"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "password_digest"
  end

end
