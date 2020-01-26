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

ActiveRecord::Schema.define(version: 2020_01_26_102829) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "artist_boards", force: :cascade do |t|
    t.string "artists"
    t.text "albums"
    t.text "profiles"
    t.string "icon"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "board_comments", force: :cascade do |t|
    t.text "content", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "artist_board_id"
    t.bigint "user_id"
    t.index ["artist_board_id"], name: "index_board_comments_on_artist_board_id"
    t.index ["user_id"], name: "index_board_comments_on_user_id"
  end

  create_table "categories", force: :cascade do |t|
    t.string "name", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "categorizes", force: :cascade do |t|
    t.bigint "category_id"
    t.bigint "artist_board_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["artist_board_id"], name: "index_categorizes_on_artist_board_id"
    t.index ["category_id"], name: "index_categorizes_on_category_id"
  end

  create_table "event_comments", force: :cascade do |t|
    t.text "content", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "events", force: :cascade do |t|
    t.string "title", null: false
    t.string "place", null: false
    t.datetime "date"
    t.text "content", null: false
    t.datetime "deadline", null: false
    t.integer "capacity"
    t.string "image"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "owner_id"
    t.bigint "artist_board_id"
    t.index ["artist_board_id"], name: "index_events_on_artist_board_id"
    t.index ["owner_id"], name: "index_events_on_owner_id"
  end

  create_table "fans", force: :cascade do |t|
    t.integer "user_id"
    t.integer "artist_board_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "favorites", force: :cascade do |t|
    t.bigint "user_id"
    t.bigint "board_comment_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["board_comment_id"], name: "index_favorites_on_board_comment_id"
    t.index ["user_id"], name: "index_favorites_on_user_id"
  end

  create_table "labellings", force: :cascade do |t|
    t.bigint "event_id"
    t.bigint "label_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["event_id"], name: "index_labellings_on_event_id"
    t.index ["label_id"], name: "index_labellings_on_label_id"
  end

  create_table "labels", force: :cascade do |t|
    t.string "name", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "participants", force: :cascade do |t|
    t.bigint "user_id"
    t.bigint "event_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["event_id"], name: "index_participants_on_event_id"
    t.index ["user_id"], name: "index_participants_on_user_id"
  end

  create_table "relationships", force: :cascade do |t|
    t.integer "follower_id"
    t.integer "followed_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["followed_id"], name: "index_relationships_on_followed_id"
    t.index ["follower_id", "followed_id"], name: "index_relationships_on_follower_id_and_followed_id", unique: true
    t.index ["follower_id"], name: "index_relationships_on_follower_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "name", null: false
    t.string "email", null: false
    t.text "profile"
    t.string "profile_image"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer "sign_in_count", default: 0, null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.inet "current_sign_in_ip"
    t.inet "last_sign_in_ip"
    t.string "confirmation_token"
    t.datetime "confirmed_at"
    t.datetime "confirmation_sent_at"
    t.string "unconfirmed_email"
    t.boolean "admin", default: false
    t.index ["confirmation_token"], name: "index_users_on_confirmation_token", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  add_foreign_key "board_comments", "artist_boards"
  add_foreign_key "board_comments", "users"
  add_foreign_key "categorizes", "artist_boards"
  add_foreign_key "categorizes", "categories"
  add_foreign_key "events", "artist_boards"
  add_foreign_key "events", "users", column: "owner_id"
  add_foreign_key "favorites", "board_comments"
  add_foreign_key "favorites", "users"
  add_foreign_key "labellings", "events"
  add_foreign_key "labellings", "labels"
  add_foreign_key "participants", "events"
  add_foreign_key "participants", "users"
end
