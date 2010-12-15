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

ActiveRecord::Schema.define(:version => 20101214232059) do

  create_table "articles", :force => true do |t|
    t.integer  "board_id"
    t.integer  "owner_id"
    t.integer  "article_no"
    t.integer  "parent_no"
    t.integer  "thread_no"
    t.string   "name"
    t.integer  "hits_count"
    t.integer  "comments_count"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "articles", ["board_id", "article_no"], :name => "index_articles_on_board_id_and_article_no", :unique => true
  add_index "articles", ["board_id", "thread_no"], :name => "index_articles_on_board_id_and_thread_no"
  add_index "articles", ["owner_id"], :name => "index_articles_on_owner_id"

  create_table "boards", :force => true do |t|
    t.integer  "group_id"
    t.integer  "owner_id"
    t.string   "name"
    t.integer  "max_article_no", :default => 0
    t.integer  "max_comment_no", :default => 0
    t.integer  "articles_count", :default => 0
    t.integer  "comments_count", :default => 0
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "boards", ["group_id"], :name => "index_boards_on_group_id"
  add_index "boards", ["owner_id"], :name => "index_boards_on_owner_id"

  create_table "comments", :force => true do |t|
    t.integer  "board_id"
    t.integer  "owner_id"
    t.integer  "article_id"
    t.integer  "comment_no"
    t.text     "body"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "comments", ["board_id", "article_id"], :name => "index_comments_on_board_id_and_article_id"
  add_index "comments", ["board_id", "comment_no"], :name => "index_comments_on_board_id_and_comment_no", :unique => true
  add_index "comments", ["owner_id"], :name => "index_comments_on_owner_id"

  create_table "groups", :force => true do |t|
    t.integer  "parent_id"
    t.integer  "owner_id"
    t.string   "name"
    t.integer  "boards_count", :default => 0
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "groups", ["owner_id"], :name => "index_groups_on_owner_id"
  add_index "groups", ["parent_id"], :name => "index_groups_on_parent_id"

  create_table "users", :force => true do |t|
    t.string   "email",                               :default => "", :null => false
    t.string   "encrypted_password",   :limit => 128, :default => "", :null => false
    t.string   "password_salt",                       :default => "", :null => false
    t.string   "reset_password_token"
    t.string   "remember_token"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",                       :default => 0
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.integer  "groups_count",                        :default => 0
    t.integer  "boards_count",                        :default => 0
    t.integer  "articles_count",                      :default => 0
    t.integer  "comments_count",                      :default => 0
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "users", ["email"], :name => "index_users_on_email", :unique => true
  add_index "users", ["reset_password_token"], :name => "index_users_on_reset_password_token", :unique => true

end
