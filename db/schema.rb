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

ActiveRecord::Schema.define(version: 2019_06_28_191000) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "active_storage_attachments", force: :cascade do |t|
    t.string "name", null: false
    t.string "record_type", null: false
    t.bigint "record_id", null: false
    t.bigint "blob_id", null: false
    t.datetime "created_at", null: false
    t.index ["blob_id"], name: "index_active_storage_attachments_on_blob_id"
    t.index ["record_type", "record_id", "name", "blob_id"], name: "index_active_storage_attachments_uniqueness", unique: true
  end

  create_table "active_storage_blobs", force: :cascade do |t|
    t.string "key", null: false
    t.string "filename", null: false
    t.string "content_type"
    t.text "metadata"
    t.bigint "byte_size", null: false
    t.string "checksum", null: false
    t.datetime "created_at", null: false
    t.index ["key"], name: "index_active_storage_blobs_on_key", unique: true
  end

  create_table "candidates", force: :cascade do |t|
    t.string "name"
    t.string "email"
    t.string "phone"
    t.string "address"
    t.string "city"
    t.string "state"
    t.string "zip"
    t.string "experience"
    t.string "background"
    t.string "preferred_state"
    t.string "preferred_city"
    t.string "cash"
    t.string "time_frame"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "honey"
  end

  create_table "contacts", force: :cascade do |t|
    t.string "name"
    t.string "email"
    t.string "phone"
    t.string "location"
    t.string "singup"
    t.string "grapevine"
    t.string "content"
    t.string "honey"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "estates", force: :cascade do |t|
    t.string "company"
    t.string "first_name"
    t.string "last_name"
    t.string "address"
    t.string "address2"
    t.string "city"
    t.string "county"
    t.string "state"
    t.string "zip"
    t.string "email"
    t.string "phone"
    t.string "est_address"
    t.string "est_address2"
    t.string "est_city"
    t.string "est_county"
    t.string "est_state"
    t.string "est_zip"
    t.string "est_develop"
    t.string "est_footage"
    t.string "est_type"
    t.string "est_timeframe"
    t.string "grapevine"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "honey"
    t.string "other"
    t.string "source"
    t.string "landlord"
  end

  create_table "friendly_id_slugs", id: :serial, force: :cascade do |t|
    t.string "slug", null: false
    t.integer "sluggable_id", null: false
    t.string "sluggable_type", limit: 50
    t.string "scope"
    t.datetime "created_at"
    t.index ["slug", "sluggable_type", "scope"], name: "index_friendly_id_slugs_on_slug_and_sluggable_type_and_scope", unique: true
    t.index ["slug", "sluggable_type"], name: "index_friendly_id_slugs_on_slug_and_sluggable_type"
    t.index ["sluggable_id"], name: "index_friendly_id_slugs_on_sluggable_id"
    t.index ["sluggable_type"], name: "index_friendly_id_slugs_on_sluggable_type"
  end

  create_table "images", force: :cascade do |t|
    t.text "image_data"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "locations", force: :cascade do |t|
    t.string "street_address_one"
    t.string "street_address_two"
    t.string "city"
    t.string "og_state"
    t.string "zip"
    t.string "phone"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.float "latitude"
    t.float "longitude"
    t.string "store_name"
    t.string "email_address"
    t.string "hours"
    t.string "slug"
    t.string "fb"
    t.string "twitter"
    t.string "insta"
    t.string "site"
    t.string "image"
    t.string "yelp"
    t.integer "state_id"
    t.boolean "coming_soon"
    t.index ["city"], name: "index_locations_on_city"
    t.index ["og_state"], name: "index_locations_on_og_state"
    t.index ["state_id"], name: "index_locations_on_state_id"
    t.index ["zip"], name: "index_locations_on_zip"
  end

  create_table "posts", force: :cascade do |t|
    t.string "title"
    t.string "image"
    t.text "content"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "slug"
    t.string "url"
    t.date "date"
  end

  create_table "reporters", force: :cascade do |t|
    t.string "first_name"
    t.string "last_name"
    t.string "email"
    t.string "phone"
    t.string "outlet"
    t.string "deadline"
    t.string "question"
    t.string "honey"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "shops", force: :cascade do |t|
    t.string "store_name"
    t.string "street_address_one"
    t.string "street_address_two"
    t.string "city"
    t.integer "state_id"
    t.string "og_state"
    t.string "zip"
    t.string "phone"
    t.string "email_address"
    t.string "hours"
    t.string "slug"
    t.string "fb"
    t.string "twitter"
    t.string "insta"
    t.string "site"
    t.string "image"
    t.string "yelp"
    t.float "latitude"
    t.float "longitude"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["city"], name: "index_shops_on_city"
    t.index ["og_state"], name: "index_shops_on_og_state"
    t.index ["state_id"], name: "index_shops_on_state_id"
    t.index ["zip"], name: "index_shops_on_zip"
  end

  create_table "slides", force: :cascade do |t|
    t.string "image"
    t.string "title"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "order"
    t.boolean "display"
    t.string "link"
  end

  create_table "states", force: :cascade do |t|
    t.string "name"
    t.string "full_name"
    t.string "slug"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["full_name"], name: "index_states_on_full_name"
    t.index ["id"], name: "index_states_on_id"
    t.index ["name"], name: "index_states_on_name"
    t.index ["slug"], name: "index_states_on_slug"
  end

  create_table "taggings", force: :cascade do |t|
    t.bigint "tag_id"
    t.bigint "location_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["location_id"], name: "index_taggings_on_location_id"
    t.index ["tag_id"], name: "index_taggings_on_tag_id"
  end

  create_table "tags", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "display_name"
  end

  create_table "users", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.boolean "admin", default: false
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  create_table "vendors", force: :cascade do |t|
    t.string "name"
    t.string "company"
    t.string "email"
    t.string "phone"
    t.string "product"
    t.string "honey"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "address"
    t.string "website"
    t.string "category"
    t.string "big_box"
    t.string "order_min"
    t.string "wholesale_price"
    t.string "source"
    t.string "shipping"
    t.string "msrp"
  end

  add_foreign_key "taggings", "locations"
  add_foreign_key "taggings", "tags"
end
