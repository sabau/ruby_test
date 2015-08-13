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

ActiveRecord::Schema.define(version: 20150813152320) do

  create_table "asset_manager_asset_associations", force: :cascade do |t|
    t.string   "owner_type"
    t.integer  "owner_id"
    t.integer  "asset_id"
    t.string   "context"
    t.integer  "position"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "asset_manager_asset_associations", ["asset_id"], name: "index_asset_manager_asset_associations_on_asset_id"
  add_index "asset_manager_asset_associations", ["owner_id", "owner_type"], name: "index_asset_associations_on_owner_id_and_owner_type"

  create_table "asset_manager_asset_categories", force: :cascade do |t|
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "asset_manager_asset_category_translations", force: :cascade do |t|
    t.integer  "asset_manager_asset_category_id", null: false
    t.string   "locale",                          null: false
    t.datetime "created_at",                      null: false
    t.datetime "updated_at",                      null: false
    t.string   "title"
  end

  add_index "asset_manager_asset_category_translations", ["asset_manager_asset_category_id"], name: "index_a6d3347cbcba9257a6aa18f210798bd90f5ac6ed"
  add_index "asset_manager_asset_category_translations", ["locale"], name: "index_asset_manager_asset_category_translations_on_locale"

  create_table "asset_manager_asset_instances", force: :cascade do |t|
    t.integer  "asset_id"
    t.string   "file"
    t.string   "instance_context"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "asset_manager_asset_instances", ["asset_id"], name: "index_asset_manager_asset_instances_on_asset_id"
  add_index "asset_manager_asset_instances", ["instance_context"], name: "index_asset_manager_asset_instances_on_instance_context"

  create_table "asset_manager_asset_translations", force: :cascade do |t|
    t.integer  "asset_manager_asset_id", null: false
    t.string   "locale",                 null: false
    t.datetime "created_at",             null: false
    t.datetime "updated_at",             null: false
    t.string   "title"
    t.text     "description"
  end

  add_index "asset_manager_asset_translations", ["asset_manager_asset_id"], name: "index_3204a03d5ef9f558de346018e4e6b654d39688f0"
  add_index "asset_manager_asset_translations", ["locale"], name: "index_asset_manager_asset_translations_on_locale"

  create_table "asset_manager_assets", force: :cascade do |t|
    t.integer  "asset_category_id"
    t.boolean  "public"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "file_type"
  end

  add_index "asset_manager_assets", ["asset_category_id"], name: "index_asset_manager_assets_on_asset_category_id"

  create_table "categories", force: :cascade do |t|
    t.string   "title"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "features", force: :cascade do |t|
    t.string   "name"
    t.text     "description"
    t.integer  "product_id"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

  add_index "features", ["product_id"], name: "index_features_on_product_id"

  create_table "news", force: :cascade do |t|
    t.string   "title"
    t.text     "description"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
    t.date     "date"
  end

  create_table "news_products", id: false, force: :cascade do |t|
    t.integer  "product_id"
    t.integer  "news_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_index "news_products", ["news_id"], name: "index_news_products_on_news_id"
  add_index "news_products", ["product_id"], name: "index_news_products_on_product_id"

  create_table "products", force: :cascade do |t|
    t.string   "title"
    t.text     "description"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
    t.integer  "category_id"
  end

  add_index "products", ["category_id"], name: "index_products_on_category_id"

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

  create_table "users", force: :cascade do |t|
    t.string   "email",                  default: "", null: false
    t.string   "encrypted_password",     default: "", null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          default: 0,  null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.datetime "created_at",                          null: false
    t.datetime "updated_at",                          null: false
  end

  add_index "users", ["email"], name: "index_users_on_email", unique: true
  add_index "users", ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true

end
