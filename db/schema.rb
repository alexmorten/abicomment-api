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

ActiveRecord::Schema.define(version: 20170603102657) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "anecdotes", force: :cascade do |t|
    t.text     "text"
    t.integer  "user_id"
    t.integer  "course_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_index "anecdotes", ["course_id"], name: "index_anecdotes_on_course_id", using: :btree
  add_index "anecdotes", ["user_id"], name: "index_anecdotes_on_user_id", using: :btree

  create_table "attendings", force: :cascade do |t|
    t.integer  "course_id"
    t.integer  "user_id"
    t.string   "note"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_index "attendings", ["course_id"], name: "index_attendings_on_course_id", using: :btree
  add_index "attendings", ["user_id"], name: "index_attendings_on_user_id", using: :btree

  create_table "comments", force: :cascade do |t|
    t.string   "text"
    t.integer  "user_id"
    t.datetime "created_at",   null: false
    t.datetime "updated_at",   null: false
    t.integer  "commentor_id"
  end

  add_index "comments", ["user_id"], name: "index_comments_on_user_id", using: :btree

  create_table "courses", force: :cascade do |t|
    t.string   "teacher"
    t.string   "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer  "user_id"
  end

  add_index "courses", ["user_id"], name: "index_courses_on_user_id", using: :btree

  create_table "facts", force: :cascade do |t|
    t.integer  "user_id"
    t.text     "text"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_index "facts", ["user_id"], name: "index_facts_on_user_id", using: :btree

  create_table "favorites", force: :cascade do |t|
    t.integer  "user_id"
    t.integer  "favoritee_id"
    t.datetime "created_at",   null: false
    t.datetime "updated_at",   null: false
  end

  add_index "favorites", ["favoritee_id", "user_id"], name: "index_favorites_on_favoritee_id_and_user_id", unique: true, using: :btree
  add_index "favorites", ["user_id", "favoritee_id"], name: "index_favorites_on_user_id_and_favoritee_id", unique: true, using: :btree

  create_table "logs", force: :cascade do |t|
    t.text     "text"
    t.integer  "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string   "kind"
    t.string   "catagory"
  end

  add_index "logs", ["user_id"], name: "index_logs_on_user_id", using: :btree

  create_table "mottos", force: :cascade do |t|
    t.integer  "user_id"
    t.text     "text"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_index "mottos", ["user_id"], name: "index_mottos_on_user_id", using: :btree

  create_table "mottovotes", force: :cascade do |t|
    t.integer  "user_id"
    t.integer  "motto_id"
    t.text     "note"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_index "mottovotes", ["motto_id"], name: "index_mottovotes_on_motto_id", using: :btree
  add_index "mottovotes", ["user_id", "motto_id"], name: "index_mottovotes_on_user_id_and_motto_id", unique: true, using: :btree
  add_index "mottovotes", ["user_id"], name: "index_mottovotes_on_user_id", using: :btree

  create_table "options", force: :cascade do |t|
    t.string   "title"
    t.integer  "poll_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_index "options", ["poll_id"], name: "index_options_on_poll_id", using: :btree

  create_table "polls", force: :cascade do |t|
    t.text     "topic"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer  "user_id"
  end

  add_index "polls", ["user_id"], name: "index_polls_on_user_id", using: :btree

  create_table "promtableentries", force: :cascade do |t|
    t.integer  "promtable_id"
    t.integer  "user_id"
    t.integer  "seats"
    t.datetime "created_at",   null: false
    t.datetime "updated_at",   null: false
  end

  add_index "promtableentries", ["promtable_id"], name: "index_promtableentries_on_promtable_id", using: :btree
  add_index "promtableentries", ["user_id"], name: "index_promtableentries_on_user_id", using: :btree

  create_table "promtables", force: :cascade do |t|
    t.integer  "user_id"
    t.integer  "seats"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_index "promtables", ["user_id"], name: "index_promtables_on_user_id", using: :btree

  create_table "quotes", force: :cascade do |t|
    t.string   "text"
    t.string   "quoted"
    t.integer  "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_index "quotes", ["user_id"], name: "index_quotes_on_user_id", using: :btree

  create_table "transactions", force: :cascade do |t|
    t.integer  "user_id"
    t.text     "reason"
    t.decimal  "receipt"
    t.decimal  "excerpt"
    t.decimal  "cardnumber"
    t.decimal  "value"
    t.date     "date"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_index "transactions", ["user_id"], name: "index_transactions_on_user_id", using: :btree

  create_table "users", force: :cascade do |t|
    t.string   "name"
    t.string   "age"
    t.datetime "created_at",                               null: false
    t.datetime "updated_at",                               null: false
    t.string   "provider",               default: "email", null: false
    t.string   "uid",                    default: "",      null: false
    t.string   "encrypted_password",     default: "",      null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          default: 0,       null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.string   "nickname"
    t.string   "image"
    t.string   "email"
    t.text     "tokens"
    t.integer  "status",                 default: 0
    t.string   "forename"
  end

  add_index "users", ["email"], name: "index_users_on_email", using: :btree
  add_index "users", ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true, using: :btree
  add_index "users", ["uid", "provider"], name: "index_users_on_uid_and_provider", unique: true, using: :btree

  create_table "votes", force: :cascade do |t|
    t.integer  "user_id"
    t.integer  "option_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_index "votes", ["option_id", "user_id"], name: "index_votes_on_option_id_and_user_id", unique: true, using: :btree
  add_index "votes", ["option_id"], name: "index_votes_on_option_id", using: :btree
  add_index "votes", ["user_id"], name: "index_votes_on_user_id", using: :btree

  add_foreign_key "anecdotes", "courses"
  add_foreign_key "anecdotes", "users"
  add_foreign_key "attendings", "courses"
  add_foreign_key "attendings", "users"
  add_foreign_key "comments", "users"
  add_foreign_key "courses", "users"
  add_foreign_key "facts", "users"
  add_foreign_key "logs", "users"
  add_foreign_key "mottos", "users"
  add_foreign_key "mottovotes", "mottos"
  add_foreign_key "mottovotes", "users"
  add_foreign_key "options", "polls"
  add_foreign_key "polls", "users"
  add_foreign_key "promtableentries", "promtables"
  add_foreign_key "promtableentries", "users"
  add_foreign_key "promtables", "users"
  add_foreign_key "quotes", "users"
  add_foreign_key "transactions", "users"
  add_foreign_key "votes", "options"
  add_foreign_key "votes", "users"
end
