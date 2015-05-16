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

ActiveRecord::Schema.define(version: 20150429141554) do

  create_table "audios", force: :cascade do |t|
    t.string   "audio_url"
    t.integer  "location_id"
    t.integer  "tour_id"
    t.integer  "guide_id"
    t.integer  "participant_id"
    t.datetime "created_at",     null: false
    t.datetime "updated_at",     null: false
  end

  create_table "badge_users", force: :cascade do |t|
    t.integer  "user_id"
    t.integer  "badge_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "badges", force: :cascade do |t|
    t.integer  "requirement"
    t.string   "name"
    t.string   "description"
    t.string   "badge_type"
    t.string   "image_url"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

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
    t.string   "image"
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
    t.integer  "participant_id"
    t.integer  "guide_id"
    t.integer  "location_id"
    t.integer  "tour_id"
    t.string   "content"
    t.datetime "created_at",     null: false
    t.datetime "updated_at",     null: false
  end

  add_index "comments", ["guide_id"], name: "index_comments_on_guide_id"
  add_index "comments", ["location_id"], name: "index_comments_on_location_id"
  add_index "comments", ["participant_id"], name: "index_comments_on_participant_id"
  add_index "comments", ["tour_id"], name: "index_comments_on_tour_id"

  create_table "countries", force: :cascade do |t|
    t.string   "name"
    t.string   "code"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "friendships", force: :cascade do |t|
    t.boolean  "approved",   default: false
    t.integer  "friend_id"
    t.integer  "user_id"
    t.string   "status"
    t.datetime "created_at",                 null: false
    t.datetime "updated_at",                 null: false
  end

  create_table "guide_comments", force: :cascade do |t|
    t.integer  "guide_id"
    t.integer  "comment_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_index "guide_comments", ["comment_id"], name: "index_guide_comments_on_comment_id"
  add_index "guide_comments", ["guide_id"], name: "index_guide_comments_on_guide_id"

  create_table "guideratings", force: :cascade do |t|
    t.integer  "guide_id"
    t.integer  "rating"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_index "guideratings", ["guide_id"], name: "index_guideratings_on_guide_id"

  create_table "images", force: :cascade do |t|
    t.string   "image_url"
    t.integer  "location_id"
    t.integer  "tour_id"
    t.integer  "guide_id"
    t.integer  "participant_id"
    t.integer  "comment_id"
    t.integer  "review_id"
    t.integer  "city_id"
    t.datetime "created_at",     null: false
    t.datetime "updated_at",     null: false
  end

  create_table "location_participants", force: :cascade do |t|
    t.integer  "location_id"
    t.integer  "participant_id"
    t.boolean  "checkin"
    t.datetime "created_at",     null: false
    t.datetime "updated_at",     null: false
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
    t.string   "address"
    t.string   "lat"
    t.string   "lng"
    t.integer  "step"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
    t.text     "description"
    t.string   "image_url"
    t.string   "image"
    t.string   "audio"
    t.string   "video"
  end

  create_table "mailboxer_conversation_opt_outs", force: :cascade do |t|
    t.integer "unsubscriber_id"
    t.string  "unsubscriber_type"
    t.integer "conversation_id"
  end

  add_index "mailboxer_conversation_opt_outs", ["conversation_id"], name: "index_mailboxer_conversation_opt_outs_on_conversation_id"
  add_index "mailboxer_conversation_opt_outs", ["unsubscriber_id", "unsubscriber_type"], name: "index_mailboxer_conversation_opt_outs_on_unsubscriber_id_type"

  create_table "mailboxer_conversations", force: :cascade do |t|
    t.string   "subject",    default: ""
    t.datetime "created_at",              null: false
    t.datetime "updated_at",              null: false
  end

  create_table "mailboxer_notifications", force: :cascade do |t|
    t.string   "type"
    t.text     "body"
    t.string   "subject",              default: ""
    t.integer  "sender_id"
    t.string   "sender_type"
    t.integer  "conversation_id"
    t.boolean  "draft",                default: false
    t.string   "notification_code"
    t.integer  "notified_object_id"
    t.string   "notified_object_type"
    t.string   "attachment"
    t.datetime "updated_at",                           null: false
    t.datetime "created_at",                           null: false
    t.boolean  "global",               default: false
    t.datetime "expires"
  end

  add_index "mailboxer_notifications", ["conversation_id"], name: "index_mailboxer_notifications_on_conversation_id"
  add_index "mailboxer_notifications", ["notified_object_id", "notified_object_type"], name: "index_mailboxer_notifications_on_notified_object_id_and_type"
  add_index "mailboxer_notifications", ["sender_id", "sender_type"], name: "index_mailboxer_notifications_on_sender_id_and_sender_type"
  add_index "mailboxer_notifications", ["type"], name: "index_mailboxer_notifications_on_type"

  create_table "mailboxer_receipts", force: :cascade do |t|
    t.integer  "receiver_id"
    t.string   "receiver_type"
    t.integer  "notification_id",                            null: false
    t.boolean  "is_read",                    default: false
    t.boolean  "trashed",                    default: false
    t.boolean  "deleted",                    default: false
    t.string   "mailbox_type",    limit: 25
    t.datetime "created_at",                                 null: false
    t.datetime "updated_at",                                 null: false
  end

  add_index "mailboxer_receipts", ["notification_id"], name: "index_mailboxer_receipts_on_notification_id"
  add_index "mailboxer_receipts", ["receiver_id", "receiver_type"], name: "index_mailboxer_receipts_on_receiver_id_and_receiver_type"

  create_table "participant_comments", force: :cascade do |t|
    t.integer  "participant_id"
    t.integer  "comment_id"
    t.datetime "created_at",     null: false
    t.datetime "updated_at",     null: false
  end

  add_index "participant_comments", ["comment_id"], name: "index_participant_comments_on_comment_id"
  add_index "participant_comments", ["participant_id"], name: "index_participant_comments_on_participant_id"

  create_table "participant_locations", force: :cascade do |t|
    t.integer  "participant_id"
    t.integer  "location_id"
    t.datetime "created_at",     null: false
    t.datetime "updated_at",     null: false
  end

  create_table "participant_tours", force: :cascade do |t|
    t.integer  "participant_id"
    t.integer  "tour_id"
    t.datetime "created_at",                     null: false
    t.datetime "updated_at",                     null: false
    t.boolean  "completed",      default: false
  end

  create_table "reviews", force: :cascade do |t|
    t.integer  "participant_id"
    t.integer  "tour_id"
    t.text     "content"
    t.integer  "rating"
    t.datetime "created_at",     null: false
    t.datetime "updated_at",     null: false
  end

  add_index "reviews", ["participant_id"], name: "index_reviews_on_participant_id"
  add_index "reviews", ["tour_id"], name: "index_reviews_on_tour_id"

  create_table "tag_suggestions", force: :cascade do |t|
    t.string   "term"
    t.integer  "popularity"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

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
    t.integer  "guide_id"
    t.string   "title"
    t.string   "description"
    t.float    "average_score"
    t.boolean  "published",     default: false
    t.datetime "created_at",                    null: false
    t.datetime "updated_at",                    null: false
    t.string   "image"
    t.string   "imrl"
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
    t.string   "email",                  default: "",  null: false
    t.string   "encrypted_password",     default: "",  null: false
    t.string   "name"
    t.string   "gender"
    t.date     "dob"
    t.float    "average_score",          default: 0.0
    t.string   "location"
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          default: 0,   null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "provider"
    t.string   "uid"
    t.string   "image"
  end

  add_index "users", ["email"], name: "index_users_on_email", unique: true
  add_index "users", ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true

  create_table "videos", force: :cascade do |t|
    t.string   "video_url"
    t.integer  "location_id"
    t.integer  "tour_id"
    t.integer  "guide_id"
    t.integer  "participant_id"
    t.datetime "created_at",     null: false
    t.datetime "updated_at",     null: false
  end

end
