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

ActiveRecord::Schema.define(:version => 20111114184036) do

  create_table "answers", :force => true do |t|
    t.integer  "question_id",                  :null => false
    t.text     "content",                      :null => false
    t.integer  "weight",        :default => 1, :null => false
    t.integer  "display_order", :default => 0, :null => false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "assessments", :force => true do |t|
    t.text     "title",                        :null => false
    t.string   "slug",                         :null => false
    t.text     "description"
    t.integer  "display_order", :default => 0, :null => false
    t.integer  "status",        :default => 1, :null => false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "pages", :force => true do |t|
    t.text     "title",                               :null => false
    t.text     "body"
    t.text     "style"
    t.text     "meta_description"
    t.text     "meta_keywords"
    t.string   "slug",                                :null => false
    t.integer  "parent_id"
    t.integer  "display_order",    :default => 0,     :null => false
    t.integer  "status",           :default => 1,     :null => false
    t.boolean  "private",          :default => false, :null => false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "pictures", :force => true do |t|
    t.text     "title"
    t.text     "alt_text"
    t.text     "caption"
    t.string   "image"
    t.string   "md5"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "posts", :force => true do |t|
    t.text     "title",                               :null => false
    t.text     "body"
    t.text     "style"
    t.text     "meta_description"
    t.text     "meta_keywords"
    t.string   "slug",                                :null => false
    t.integer  "user_id",                             :null => false
    t.integer  "status",           :default => 1,     :null => false
    t.boolean  "private",          :default => false, :null => false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "questions", :force => true do |t|
    t.integer  "section_id",                   :null => false
    t.text     "content",                      :null => false
    t.integer  "display_order", :default => 0, :null => false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "responses", :force => true do |t|
    t.integer  "user_id",    :null => false
    t.integer  "answer_id",  :null => false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "results", :force => true do |t|
    t.integer  "resultable_id",                  :null => false
    t.string   "resultable_type",                :null => false
    t.integer  "top",             :default => 1, :null => false
    t.integer  "bottom",          :default => 0, :null => false
    t.text     "content"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "sections", :force => true do |t|
    t.integer  "assessment_id",                :null => false
    t.text     "title",                        :null => false
    t.string   "slug",                         :null => false
    t.text     "description"
    t.integer  "display_order", :default => 0, :null => false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "users", :force => true do |t|
    t.string   "email_address",                         :null => false
    t.string   "password_hash",                         :null => false
    t.string   "password_salt",                         :null => false
    t.string   "remember_me_token"
    t.string   "password_reset_token"
    t.string   "first_name"
    t.string   "last_name"
    t.string   "phone_number"
    t.string   "ip_addresses"
    t.string   "job_title"
    t.string   "street_address"
    t.string   "city"
    t.string   "zipcode"
    t.string   "state"
    t.integer  "privilege_level",        :default => 1, :null => false
    t.integer  "login_count",            :default => 0, :null => false
    t.integer  "post_count",             :default => 0, :null => false
    t.datetime "password_reset_sent_at"
    t.datetime "last_login"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "versions", :force => true do |t|
    t.string   "item_type",  :null => false
    t.integer  "item_id",    :null => false
    t.string   "event",      :null => false
    t.string   "whodunnit"
    t.text     "object"
    t.datetime "created_at"
  end

  add_index "versions", ["item_type", "item_id"], :name => "index_versions_on_item_type_and_item_id"

end
