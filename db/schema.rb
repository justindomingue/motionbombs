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

ActiveRecord::Schema.define(:version => 20120728160316) do

  create_table "active_admin_comments", :force => true do |t|
    t.string    "resource_id",   :null => false
    t.string    "resource_type", :null => false
    t.integer   "author_id"
    t.string    "author_type"
    t.text      "body"
    t.timestamp "created_at",    :null => false
    t.timestamp "updated_at",    :null => false
    t.string    "namespace"
  end

  add_index "active_admin_comments", ["author_type", "author_id"], :name => "index_active_admin_comments_on_author_type_and_author_id"
  add_index "active_admin_comments", ["namespace"], :name => "index_active_admin_comments_on_namespace"
  add_index "active_admin_comments", ["resource_type", "resource_id"], :name => "index_admin_notes_on_resource_type_and_resource_id"

  create_table "admin_users", :force => true do |t|
    t.string    "email",                  :default => "", :null => false
    t.string    "encrypted_password",     :default => "", :null => false
    t.string    "reset_password_token"
    t.timestamp "reset_password_sent_at"
    t.timestamp "remember_created_at"
    t.integer   "sign_in_count",          :default => 0
    t.timestamp "current_sign_in_at"
    t.timestamp "last_sign_in_at"
    t.string    "current_sign_in_ip"
    t.string    "last_sign_in_ip"
    t.timestamp "created_at",                             :null => false
    t.timestamp "updated_at",                             :null => false
  end

  add_index "admin_users", ["email"], :name => "index_admin_users_on_email", :unique => true
  add_index "admin_users", ["reset_password_token"], :name => "index_admin_users_on_reset_password_token", :unique => true

  create_table "authentications", :force => true do |t|
    t.integer   "user_id",    :null => false
    t.string    "provider",   :null => false
    t.string    "uid",        :null => false
    t.timestamp "created_at", :null => false
    t.timestamp "updated_at", :null => false
  end

  create_table "categories", :force => true do |t|
    t.string    "name"
    t.string    "description"
    t.timestamp "created_at",  :null => false
    t.timestamp "updated_at",  :null => false
  end

  create_table "helps", :force => true do |t|
    t.string    "name"
    t.string    "email"
    t.text      "message"
    t.timestamp "created_at", :null => false
    t.timestamp "updated_at", :null => false
    t.string    "status"
  end

  create_table "likes", :force => true do |t|
    t.integer   "user_id"
    t.integer   "video_id"
    t.timestamp "created_at", :null => false
    t.timestamp "updated_at", :null => false
  end

  create_table "notifications", :force => true do |t|
    t.integer  "receiver_id"
    t.integer  "sender_id"
    t.integer  "video_id"
    t.string   "action"
    t.boolean  "status"
    t.datetime "created_at",  :null => false
    t.datetime "updated_at",  :null => false
  end

  create_table "users", :force => true do |t|
    t.string    "username",                     :null => false
    t.string    "email"
    t.string    "crypted_password"
    t.string    "salt"
    t.timestamp "created_at",                   :null => false
    t.timestamp "updated_at",                   :null => false
    t.string    "remember_me_token"
    t.timestamp "remember_me_token_expires_at"
  end

  add_index "users", ["remember_me_token"], :name => "index_users_on_remember_me_token"

  create_table "video_comments", :force => true do |t|
    t.integer   "user_id"
    t.integer   "video_id"
    t.text      "content"
    t.integer   "mood",       :default => 0
    t.timestamp "created_at",                :null => false
    t.timestamp "updated_at",                :null => false
  end

  create_table "videos", :force => true do |t|
    t.string   "title"
    t.text     "description"
    t.string   "thumb"
    t.integer  "url"
    t.string   "provider_video_id"
    t.string   "provider"
    t.integer  "views"
    t.datetime "created_at",                          :null => false
    t.datetime "updated_at",                          :null => false
    t.integer  "user_id"
    t.integer  "category_id"
    t.string   "creator"
    t.integer  "video_comments_count", :default => 0
    t.integer  "likes_count",          :default => 0
  end

  add_index "videos", ["category_id", "created_at"], :name => "index_videos_on_category_id_and_created_at"
  add_index "videos", ["user_id", "created_at"], :name => "index_videos_on_user_id_and_created_at"

  create_table "visits", :force => true do |t|
    t.integer   "video_id"
    t.integer   "user_id"
    t.string    "ip"
    t.integer   "visits"
    t.timestamp "created_at", :null => false
    t.timestamp "updated_at", :null => false
  end

end
