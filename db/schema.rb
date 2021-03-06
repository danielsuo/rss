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
# It's strongly recommended to check this file into your version control system.

ActiveRecord::Schema.define(:version => 20130717000708) do

  create_table "dashboards", :force => true do |t|
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
    t.integer  "user_id"
  end

  create_table "feeds", :force => true do |t|
    t.string   "title"
    t.string   "link"
    t.string   "description"
    t.datetime "created_at",  :null => false
    t.datetime "updated_at",  :null => false
    t.string   "user_id"
    t.integer  "items_count"
  end

  create_table "items", :force => true do |t|
    t.string   "title"
    t.string   "link"
    t.string   "description"
    t.integer  "feed_id"
    t.datetime "created_at",                     :null => false
    t.datetime "updated_at",                     :null => false
    t.string   "published"
    t.boolean  "read"
    t.boolean  "starred",     :default => false
  end

  create_table "users", :force => true do |t|
    t.string   "name"
    t.string   "email"
    t.datetime "created_at",               :null => false
    t.datetime "updated_at",               :null => false
    t.string   "password_digest"
    t.string   "remember_token"
    t.integer  "feeds_count"
    t.string   "twitter_oauth_token"
    t.string   "twitter_oauth_secret"
    t.string   "twitter_handle"
    t.string   "twitter_uid"
    t.string   "pocket_handle"
    t.string   "pocket_oauth_token"
    t.string   "readability_oauth_token"
    t.string   "readability_oauth_secret"
    t.string   "readability_handle"
  end

  add_index "users", ["email"], :name => "index_users_on_email", :unique => true
  add_index "users", ["remember_token"], :name => "index_users_on_remember_token"

end
