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

ActiveRecord::Schema.define(version: 2018_07_25_071053) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "addresses", force: :cascade do |t|
    t.string "city"
    t.string "district"
    t.string "street"
    t.integer "house_no"
    t.bigint "post_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["post_id"], name: "index_addresses_on_post_id"
  end

  create_table "api_keys", force: :cascade do |t|
    t.string "access_token", null: false
    t.boolean "active", default: true, null: false
    t.datetime "expires_at"
    t.bigint "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["user_id"], name: "index_api_keys_on_user_id"
  end

  create_table "details", force: :cascade do |t|
    t.integer "no_people_per_room"
    t.string "gender"
    t.boolean "air_conditioner"
    t.boolean "washing_machine"
    t.boolean "refrigerator"
    t.boolean "WC"
    t.boolean "parking"
    t.boolean "Wifi"
    t.boolean "free_time"
    t.boolean "separated_owner"
    t.boolean "kitchen"
    t.boolean "bed"
    t.boolean "television"
    t.boolean "Wardrobe"
    t.boolean "amezzanine"
    t.boolean "camera"
    t.boolean "security"
    t.boolean "pet"
    t.bigint "post_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["post_id"], name: "index_details_on_post_id"
  end

  create_table "images", force: :cascade do |t|
    t.string "image_file_name"
    t.string "image_content_type"
    t.integer "image_file_size"
    t.datetime "image_updated_at"
    t.bigint "post_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["post_id"], name: "index_images_on_post_id"
  end

  create_table "posts", force: :cascade do |t|
    t.string "tittle"
    t.float "price"
    t.float "area"
    t.text "decription"
    t.datetime "date_post"
    t.string "phone_contact_number"
    t.bigint "user_id"
    t.bigint "type_house_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["type_house_id"], name: "index_posts_on_type_house_id"
    t.index ["user_id"], name: "index_posts_on_user_id"
  end

  create_table "type_houses", force: :cascade do |t|
    t.string "type_house"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
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
    t.string "full_name"
    t.string "phone_number"
    t.string "avatar"
    t.integer "role", default: 0
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  add_foreign_key "addresses", "posts"
  add_foreign_key "details", "posts"
  add_foreign_key "images", "posts"
  add_foreign_key "posts", "type_houses"
  add_foreign_key "posts", "users"
end
