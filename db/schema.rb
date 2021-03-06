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

ActiveRecord::Schema.define(version: 2018_05_27_172743) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "current_talks", force: :cascade do |t|
    t.integer "user_id"
    t.integer "talk_params"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "friends", force: :cascade do |t|
    t.integer "from"
    t.integer "to"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "block"
  end

  create_table "maybe_friends", force: :cascade do |t|
    t.integer "from"
    t.integer "to"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "block"
  end

  create_table "posts", force: :cascade do |t|
    t.integer "talk_id"
    t.integer "speaker"
    t.string "content"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "talks", force: :cascade do |t|
    t.integer "include"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "talk_id"
    t.string "group_name"
  end

  create_table "users", force: :cascade do |t|
    t.text "group"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.text "name"
    t.text "sms"
    t.string "remember_digest"
    t.string "phone"
    t.string "image_name"
    t.string "status_message"
    t.string "account_id"
    t.boolean "allow"
  end

end
