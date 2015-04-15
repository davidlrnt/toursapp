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

ActiveRecord::Schema.define(version: 20150414212606) do

  create_table "categories", force: :cascade do |t|
    t.string   "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "category_tags", force: :cascade do |t|
    t.integer  "tag_id"
    t.integer  "category_id"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

  add_index "category_tags", ["category_id"], name: "index_category_tags_on_category_id"
  add_index "category_tags", ["tag_id"], name: "index_category_tags_on_tag_id"

  create_table "cities", force: :cascade do |t|
    t.integer  "country_id"
    t.string   "name"
    t.string   "accent"
    t.string   "region"
    t.float    "lat"
    t.float    "long"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_index "cities", ["country_id"], name: "index_cities_on_country_id"

  create_table "city_tours", force: :cascade do |t|
    t.integer  "city_id"
    t.integer  "tour_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_index "city_tours", ["city_id"], name: "index_city_tours_on_city_id"
  add_index "city_tours", ["tour_id"], name: "index_city_tours_on_tour_id"

  create_table "comments", force: :cascade do |t|
    t.integer  "user_id"
    t.integer  "location_id"
    t.string   "content"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

  add_index "comments", ["location_id"], name: "index_comments_on_location_id"
  add_index "comments", ["user_id"], name: "index_comments_on_user_id"

  create_table "countries", force: :cascade do |t|
    t.string   "name"
    t.string   "code"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "location_tours", force: :cascade do |t|
    t.integer  "tour_id"
    t.integer  "location_id"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

  add_index "location_tours", ["location_id"], name: "index_location_tours_on_location_id"
  add_index "location_tours", ["tour_id"], name: "index_location_tours_on_tour_id"

  create_table "locations", force: :cascade do |t|
    t.string   "title"
    t.string   "long"
    t.string   "lat"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "reviews", force: :cascade do |t|
    t.integer  "user_id"
    t.integer  "tour_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_index "reviews", ["tour_id"], name: "index_reviews_on_tour_id"
  add_index "reviews", ["user_id"], name: "index_reviews_on_user_id"

  create_table "tag_tours", force: :cascade do |t|
    t.integer  "tag_id"
    t.integer  "tour_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_index "tag_tours", ["tag_id"], name: "index_tag_tours_on_tag_id"
  add_index "tag_tours", ["tour_id"], name: "index_tag_tours_on_tour_id"

  create_table "tags", force: :cascade do |t|
    t.string   "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "tours", force: :cascade do |t|
    t.integer  "category_id"
    t.string   "title"
    t.string   "description"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

  add_index "tours", ["category_id"], name: "index_tours_on_category_id"

  create_table "user_categories", force: :cascade do |t|
    t.integer  "user_id"
    t.integer  "category_id"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

  add_index "user_categories", ["category_id"], name: "index_user_categories_on_category_id"
  add_index "user_categories", ["user_id"], name: "index_user_categories_on_user_id"

  create_table "users", force: :cascade do |t|
    t.string   "name"
    t.string   "email"
    t.string   "password_digest"
    t.string   "location"
    t.date     "dob"
    t.string   "gender"
    t.datetime "created_at",      null: false
    t.datetime "updated_at",      null: false
  end

end