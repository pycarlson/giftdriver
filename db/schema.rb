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

ActiveRecord::Schema.define(:version => 20130919032715) do

  create_table "donors", :force => true do |t|
    t.integer "user_id"
    t.integer "drive_id"
    t.integer "drop_location_id"
    t.integer "family_id"
  end

  create_table "drives", :force => true do |t|
    t.string   "org_name"
    t.text     "org_blurb"
    t.string   "org_email"
    t.string   "org_phone"
    t.string   "org_address"
    t.string   "org_zipcode"
    t.string   "drive_title"
    t.text     "drive_blurb"
    t.string   "start_date"
    t.string   "end_date"
    t.datetime "created_at",            :null => false
    t.datetime "updated_at",            :null => false
    t.text     "details_for_the_donor"
    t.string   "fundraising_url"
    t.text     "fundraising_blurb"
  end

  create_table "drop_dates", :force => true do |t|
    t.text    "date_and_time"
    t.integer "drop_location_id"
    t.integer "drive_id"
  end

  create_table "drop_locations", :force => true do |t|
    t.integer "drive_id"
    t.string  "street"
    t.string  "city"
    t.string  "state"
    t.string  "zipcode"
    t.string  "code"
    t.float   "latitude"
    t.float   "longitude"
    t.boolean "gmaps"
  end

  create_table "families", :force => true do |t|
    t.integer  "drive_id"
    t.integer  "adopted_by"
    t.string   "received_at_org",  :default => "f"
    t.string   "given_to_family",  :default => "f"
    t.string   "code"
    t.datetime "created_at"
    t.integer  "drop_location_id"
    t.integer  "user_id"
    t.integer  "num_boxes"
    t.integer  "drop_date_id"
  end

  create_table "family_members", :force => true do |t|
    t.integer "family_id"
    t.string  "first_name"
    t.integer "age"
    t.string  "gender"
    t.string  "size_pants"
    t.string  "size_shirt"
    t.string  "size_dress"
    t.string  "size_shoes"
    t.text    "bio"
  end

  create_table "needs", :force => true do |t|
    t.text    "text"
    t.integer "family_member_id"
    t.integer "priority"
  end

  create_table "organizers", :force => true do |t|
    t.integer  "user_id"
    t.integer  "drive_id"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "users", :force => true do |t|
    t.string   "email",                  :default => "", :null => false
    t.string   "encrypted_password",     :default => "", :null => false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          :default => 0
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.datetime "created_at",                             :null => false
    t.datetime "updated_at",                             :null => false
    t.string   "full_name"
    t.string   "company"
    t.string   "unconfirmed_email"
    t.string   "confirmation_token"
    t.datetime "confirmed_at"
    t.datetime "confirmation_sent_at"
    t.string   "street"
    t.string   "city"
    t.string   "state"
    t.string   "zipcode"
    t.string   "phone"
  end

  add_index "users", ["confirmation_token"], :name => "index_users_on_confirmation_token", :unique => true
  add_index "users", ["email"], :name => "index_users_on_email", :unique => true
  add_index "users", ["reset_password_token"], :name => "index_users_on_reset_password_token", :unique => true

end
