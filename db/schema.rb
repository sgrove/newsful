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

ActiveRecord::Schema.define(:version => 50) do

  create_table "admins", :force => true do |t|
    t.string   "ido_id"
    t.integer  "sign_in_count",      :default => 0
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.string   "email"
    t.string   "first_name"
    t.string   "last_name"
    t.text     "about"
    t.string   "locale"
    t.string   "timezone"
    t.integer  "points"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "admins", ["email"], :name => "index_admins_on_email", :unique => true
  add_index "admins", ["ido_id"], :name => "index_admins_on_ido_id", :unique => true

  create_table "comments", :force => true do |t|
    t.integer  "author_id"
    t.string   "author_type"
    t.integer  "post_id"
    t.integer  "parent_id"
    t.text     "body"
    t.integer  "points"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "posts", :force => true do |t|
    t.integer  "poster_id"
    t.string   "poster_type"
    t.string   "title"
    t.string   "url"
    t.text     "body"
    t.integer  "points"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "users", :force => true do |t|
    t.string   "email"
    t.string   "encrypted_password",     :limit => 128, :default => "", :null => false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",                         :default => 0
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.string   "ido_id"
    t.string   "first_name"
    t.string   "last_name"
    t.text     "about"
    t.string   "locale"
    t.string   "timezone"
    t.integer  "points"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "users", ["email"], :name => "index_users_on_email", :unique => true
  add_index "users", ["ido_id"], :name => "index_users_on_ido_id", :unique => true

  create_table "votes", :force => true do |t|
    t.integer  "voter_id"
    t.string   "voter_type"
    t.integer  "votable_id"
    t.string   "votable_type"
    t.boolean  "positive"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

end
