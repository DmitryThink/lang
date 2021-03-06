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

ActiveRecord::Schema.define(version: 2018_10_18_121243) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"
  enable_extension "uuid-ossp"

  create_table "languages", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "queue_list_items", force: :cascade do |t|
    t.uuid "queue_list_id"
    t.bigint "translation_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.datetime "time_of_appearance"
    t.integer "index_of_time", default: 0
    t.boolean "word_show"
    t.index ["translation_id"], name: "index_queue_list_items_on_translation_id"
  end

  create_table "queue_lists", id: :uuid, default: -> { "uuid_generate_v4()" }, force: :cascade do |t|
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "language_from_id"
    t.integer "language_to_id"
    t.boolean "with_first_letter", default: false
    t.integer "current_queue_list_item_id"
    t.bigint "user_id"
    t.index ["user_id"], name: "index_queue_lists_on_user_id"
  end

  create_table "translations", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "language_from_id"
    t.integer "language_to_id"
    t.integer "word_from_id"
    t.integer "word_to_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer "sign_in_count", default: 0, null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.inet "current_sign_in_ip"
    t.inet "last_sign_in_ip"
    t.uuid "current_queue_list_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  create_table "words", force: :cascade do |t|
    t.string "name"
    t.bigint "language_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["language_id"], name: "index_words_on_language_id"
  end

  add_foreign_key "queue_list_items", "translations"
  add_foreign_key "words", "languages"
end
