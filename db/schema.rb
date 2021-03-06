# This file is auto-generated from the current state of the database. Instead of editing this file, 
# please use the migrations feature of Active Record to incrementally modify your database, and
# then regenerate this schema definition.
#
# Note that this schema.rb definition is the authoritative source for your database schema. If you need
# to create the application database on another system, you should be using db:schema:load, not running
# all the migrations from scratch. The latter is a flawed and unsustainable approach (the more migrations
# you'll amass, the slower it'll run and the greater likelihood for issues).
#
# It's strongly recommended to check this file into your version control system.

ActiveRecord::Schema.define(:version => 20100630101613) do

  create_table "aliment_photos", :force => true do |t|
    t.integer  "parent_id"
    t.integer  "aliment_id"
    t.string   "content_type"
    t.string   "filename"
    t.string   "thumbnail"
    t.integer  "size"
    t.integer  "width"
    t.integer  "height"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "aliment_translations", :force => true do |t|
    t.integer  "aliment_id"
    t.string   "locale"
    t.string   "description"
    t.string   "name"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "aliment_translations", ["aliment_id"], :name => "index_aliment_translations_on_aliment_id"

  create_table "aliments", :force => true do |t|
    t.string   "old_name"
    t.string   "latin_name"
    t.string   "pinyin"
    t.string   "chinese"
    t.text     "description",          :limit => 16777215
    t.integer  "savor"
    t.integer  "savor_tendence"
    t.integer  "temperature"
    t.integer  "temperature_tendence"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "category_id",                              :default => 14, :null => false
    t.string   "plural_name"
    t.string   "photo_attribution",    :limit => 512
  end

  create_table "authorships", :force => true do |t|
    t.integer  "book_id"
    t.integer  "user_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "books", :force => true do |t|
    t.string   "title"
    t.text     "description", :limit => 16777215
    t.string   "isbn"
    t.string   "language"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "authors"
  end

  create_table "categories", :force => true do |t|
    t.string   "name"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.text     "description", :limit => 16777215
  end

  create_table "category_translations", :force => true do |t|
    t.integer  "category_id"
    t.string   "locale"
    t.string   "description"
    t.string   "name"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "category_translations", ["category_id"], :name => "index_category_translations_on_category_id"

  create_table "comments", :force => true do |t|
    t.string   "title"
    t.text     "content",          :limit => 16777215
    t.integer  "user_id"
    t.string   "commentable_type"
    t.integer  "commentable_id"
    t.string   "lang"
    t.boolean  "published",                            :default => true
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "consultation_photos", :force => true do |t|
    t.integer  "parent_id"
    t.integer  "aliment_id"
    t.string   "content_type"
    t.string   "filename"
    t.string   "thumbnail"
    t.integer  "size"
    t.integer  "width"
    t.integer  "height"
    t.string   "title"
    t.integer  "consultation_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "consultations", :force => true do |t|
    t.string   "title"
    t.text     "body"
    t.boolean  "pro"
    t.string   "pro_identifier"
    t.integer  "pro_start_day"
    t.string   "website"
    t.string   "email"
    t.string   "phone"
    t.string   "fax"
    t.integer  "user_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "lang",           :default => "de"
  end

  create_table "effect_translations", :force => true do |t|
    t.integer  "effect_id"
    t.string   "locale"
    t.string   "description"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "effect_translations", ["effect_id"], :name => "index_effect_translations_on_effect_id"

  create_table "effects", :force => true do |t|
    t.string   "description"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "element_translations", :force => true do |t|
    t.integer  "element_id"
    t.string   "locale"
    t.string   "name"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "element_translations", ["element_id"], :name => "index_element_translations_on_element_id"

  create_table "elements", :force => true do |t|
    t.string   "name"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "events", :force => true do |t|
    t.string   "title"
    t.text     "body"
    t.datetime "start"
    t.datetime "end"
    t.boolean  "commercial"
    t.string   "reference_number"
    t.integer  "user_id"
    t.integer  "consultation_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "lang",             :default => "de"
  end

  create_table "favorite_aliments", :force => true do |t|
    t.integer  "user_id"
    t.integer  "aliment_id"
    t.string   "reason"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "flags", :force => true do |t|
    t.integer  "user_id"
    t.integer  "flaggable_id"
    t.string   "flaggable_type"
    t.integer  "flaggable_user_id"
    t.string   "reason"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "friendships", :force => true do |t|
    t.integer  "user_id"
    t.integer  "friend_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "locations", :force => true do |t|
    t.string   "street"
    t.string   "number"
    t.string   "additional1"
    t.string   "additional2"
    t.string   "zip"
    t.string   "city"
    t.string   "state"
    t.string   "country",        :default => "de"
    t.integer  "locatable_id"
    t.string   "locatable_type"
    t.float    "lat"
    t.float    "lng"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "open_id_authentication_associations", :force => true do |t|
    t.integer "issued"
    t.integer "lifetime"
    t.string  "handle"
    t.string  "assoc_type"
    t.binary  "server_url"
    t.binary  "secret"
  end

  create_table "open_id_authentication_nonces", :force => true do |t|
    t.integer "timestamp",  :null => false
    t.string  "server_url"
    t.string  "salt",       :null => false
  end

  create_table "organ_translations", :force => true do |t|
    t.integer  "organ_id"
    t.string   "locale"
    t.string   "name"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "organ_translations", ["organ_id"], :name => "index_organ_translations_on_organ_id"

  create_table "organs", :force => true do |t|
    t.string   "name"
    t.string   "yinyang"
    t.integer  "time"
    t.integer  "element_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "page_translations", :force => true do |t|
    t.integer  "page_id"
    t.string   "locale"
    t.string   "title"
    t.text     "body"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "page_translations", ["page_id"], :name => "index_page_translations_on_page_id"

  create_table "pages", :force => true do |t|
    t.string   "title"
    t.string   "permalink"
    t.text     "body",       :limit => 16777215
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "posts", :force => true do |t|
    t.integer  "user_id"
    t.string   "title"
    t.text     "body",       :limit => 16777215
    t.text     "permalink",  :limit => 16777215
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "lang",                           :default => "de"
  end

  create_table "profiles", :force => true do |t|
    t.text     "about",      :limit => 16777215
    t.date     "birthday"
    t.string   "quote"
    t.integer  "user_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "properties", :force => true do |t|
    t.integer  "aliment_id"
    t.integer  "effect_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "target_organs", :force => true do |t|
    t.integer "aliment_id"
    t.integer "organ_id"
  end

  create_table "user_photos", :force => true do |t|
    t.integer  "parent_id"
    t.string   "content_type"
    t.string   "filename"
    t.string   "thumbnail"
    t.integer  "size"
    t.integer  "width"
    t.integer  "height"
    t.integer  "user_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "users", :force => true do |t|
    t.string   "login",                     :limit => 40
    t.string   "name",                      :limit => 100, :default => ""
    t.string   "first_name",                :limit => 100, :default => ""
    t.string   "email",                     :limit => 100
    t.string   "crypted_password",          :limit => 256
    t.string   "password_salt",             :limit => 256
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "remember_token",            :limit => 40
    t.datetime "remember_token_expires_at"
    t.string   "activation_code",           :limit => 40
    t.datetime "activated_at"
    t.integer  "role",                                     :default => 2
    t.string   "persistence_token"
    t.integer  "login_count",                              :default => 0,  :null => false
    t.integer  "failed_login_count",                       :default => 0,  :null => false
    t.datetime "last_request_at"
    t.datetime "current_login_at"
    t.datetime "last_login_at"
    t.string   "current_login_ip"
    t.string   "last_login_ip"
    t.string   "openid_identifier"
    t.string   "perishable_token",                         :default => "", :null => false
  end

  add_index "users", ["email"], :name => "index_users_on_email"
  add_index "users", ["login"], :name => "index_users_on_login", :unique => true
  add_index "users", ["perishable_token"], :name => "index_users_on_perishable_token"

end
