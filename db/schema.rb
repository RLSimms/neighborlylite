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

ActiveRecord::Schema.define(:version => 20130602175441) do

  create_table "conversations", :force => true do |t|
    t.integer  "user_1_id"
    t.integer  "user_2_id"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "errands", :force => true do |t|
    t.string   "name"
    t.text     "description"
    t.string   "location"
    t.integer  "giving_user_id"
    t.integer  "receiving_user_id"
    t.boolean  "completed"
    t.datetime "created_at",        :null => false
    t.datetime "updated_at",        :null => false
    t.string   "price"
  end

  create_table "messages", :force => true do |t|
    t.text     "whats_written"
    t.integer  "sender_id"
    t.integer  "receiver_id"
    t.integer  "conversation_id"
    t.datetime "created_at",      :null => false
    t.datetime "updated_at",      :null => false
  end

  create_table "shared_items", :force => true do |t|
    t.string   "name"
    t.string   "description"
    t.boolean  "available"
    t.integer  "owner_user_id"
    t.integer  "borrower_user_id"
    t.datetime "created_at",       :null => false
    t.datetime "updated_at",       :null => false
    t.string   "photo"
    t.string   "price"
  end

  create_table "users", :force => true do |t|
    t.string   "name"
    t.string   "address"
    t.string   "photo"
    t.string   "email"
    t.string   "password_digest"
    t.datetime "created_at",      :null => false
    t.datetime "updated_at",      :null => false
  end

end
