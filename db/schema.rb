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

ActiveRecord::Schema.define(version: 20161112072542) do

  create_table "creators", force: :cascade do |t|
    t.string   "name"
    t.string   "description"
    t.string   "tag"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
    t.string   "image"
    t.integer  "likes_count"
    t.integer  "likes"
    t.integer  "value"
    t.string   "imagevalue"
    t.datetime "start_time"
    t.integer  "work_id"
    t.integer  "user_id"
  end

  add_index "creators", ["name"], name: "index_creators_on_name", unique: true
  add_index "creators", ["user_id"], name: "index_creators_on_user_id"

  create_table "likes", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer  "user_id"
    t.integer  "creator_id"
  end

  create_table "reviews", force: :cascade do |t|
    t.integer  "user_id"
    t.text     "body"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string   "user_name"
    t.integer  "creator_id"
  end

  add_index "reviews", ["creator_id"], name: "index_reviews_on_creator_id"
  add_index "reviews", ["user_id", "created_at"], name: "index_reviews_on_user_id_and_created_at"

  create_table "taggings", force: :cascade do |t|
    t.integer  "tag_id"
    t.integer  "taggable_id"
    t.string   "taggable_type"
    t.integer  "tagger_id"
    t.string   "tagger_type"
    t.string   "context",       limit: 128
    t.datetime "created_at"
  end

  add_index "taggings", ["tag_id", "taggable_id", "taggable_type", "context", "tagger_id", "tagger_type"], name: "taggings_idx", unique: true
  add_index "taggings", ["taggable_id", "taggable_type", "context"], name: "index_taggings_on_taggable_id_and_taggable_type_and_context"

  create_table "tags", force: :cascade do |t|
    t.string  "name"
    t.integer "taggings_count", default: 0
  end

  add_index "tags", ["name"], name: "index_tags_on_name", unique: true

  create_table "user_creators", force: :cascade do |t|
    t.integer  "user_id"
    t.integer  "creator_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "user_likes", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "users", force: :cascade do |t|
    t.string   "provider",        null: false
    t.string   "uid",             null: false
    t.string   "nickname",        null: false
    t.string   "image_url",       null: false
    t.datetime "created_at",      null: false
    t.datetime "updated_at",      null: false
    t.boolean  "admin"
    t.string   "remember_digest"
    t.integer  "likes"
    t.integer  "creators"
  end

  add_index "users", ["provider", "uid"], name: "index_users_on_provider_and_uid", unique: true
  add_index "users", ["uid"], name: "index_users_on_uid", unique: true

  create_table "works", force: :cascade do |t|
    t.datetime "created_at",                    null: false
    t.datetime "updated_at",                    null: false
    t.string   "title"
    t.string   "alpha"
    t.string   "manga"
    t.string   "anime"
    t.string   "novel"
    t.string   "manga_creator"
    t.string   "anime_creator"
    t.string   "novel_creator"
    t.integer  "creator_id"
    t.boolean  "active",        default: false, null: false
  end

end
