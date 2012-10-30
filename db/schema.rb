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

ActiveRecord::Schema.define(:version => 20121030002357) do

  create_table "admin_assignments", :force => true do |t|
    t.integer  "person_id"
    t.integer  "school_id"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  add_index "admin_assignments", ["person_id"], :name => "index_admin_assignments_on_person_id"
  add_index "admin_assignments", ["school_id"], :name => "index_admin_assignments_on_school_id"

  create_table "admins", :force => true do |t|
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "course_offerings", :force => true do |t|
    t.integer  "course_id"
    t.integer  "school_id"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  add_index "course_offerings", ["course_id"], :name => "index_course_offerings_on_course_id"
  add_index "course_offerings", ["school_id"], :name => "index_course_offerings_on_school_id"

  create_table "courses", :force => true do |t|
    t.string   "name"
    t.string   "identifier"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "follows", :force => true do |t|
    t.integer  "search_item_id"
    t.string   "url"
    t.datetime "created_at",     :null => false
    t.datetime "updated_at",     :null => false
  end

  add_index "follows", ["search_item_id"], :name => "index_follows_on_search_item_id"

  create_table "meeting_times", :force => true do |t|
    t.string   "description"
    t.boolean  "monday"
    t.boolean  "tuesday"
    t.boolean  "wednesday"
    t.boolean  "thursday"
    t.boolean  "friday"
    t.boolean  "saturday"
    t.boolean  "sunday"
    t.string   "period"
    t.time     "startTime"
    t.time     "endTime"
    t.integer  "section_id"
    t.date     "startDate"
    t.date     "endDate"
    t.datetime "created_at",  :null => false
    t.datetime "updated_at",  :null => false
    t.string   "name"
  end

  add_index "meeting_times", ["section_id"], :name => "index_meeting_times_on_section_id"

  create_table "people", :force => true do |t|
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
    t.text     "details"
    t.integer  "suspected_person_id"
    t.string   "id_number"
    t.string   "first_name"
  end

  add_index "people", ["email"], :name => "index_people_on_email", :unique => true
  add_index "people", ["reset_password_token"], :name => "index_people_on_reset_password_token", :unique => true

  create_table "rating_values", :force => true do |t|
    t.string   "name"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "ratings", :force => true do |t|
    t.integer  "search_item_id"
    t.string   "url"
    t.integer  "rating_value_id"
    t.datetime "created_at",      :null => false
    t.datetime "updated_at",      :null => false
    t.text     "result_content"
  end

  add_index "ratings", ["rating_value_id"], :name => "index_ratings_on_rating_value_id"
  add_index "ratings", ["search_item_id"], :name => "index_ratings_on_search_item_id"

  create_table "reflections", :force => true do |t|
    t.integer  "search_item_id"
    t.text     "reflection"
    t.datetime "created_at",     :null => false
    t.datetime "updated_at",     :null => false
  end

  add_index "reflections", ["search_item_id"], :name => "index_reflections_on_search_item_id"

  create_table "role_assignments", :force => true do |t|
    t.integer  "person_id"
    t.integer  "role_id"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  add_index "role_assignments", ["person_id"], :name => "index_role_assignments_on_person_id"
  add_index "role_assignments", ["role_id"], :name => "index_role_assignments_on_role_id"

  create_table "roles", :force => true do |t|
    t.string   "name"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "schools", :force => true do |t|
    t.string   "name"
    t.string   "time_zone"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "search_items", :force => true do |t|
    t.integer  "search_list_id"
    t.string   "query"
    t.datetime "created_at",     :null => false
    t.datetime "updated_at",     :null => false
  end

  create_table "search_lists", :force => true do |t|
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
    t.integer  "person_id"
  end

  create_table "section_assignments", :force => true do |t|
    t.integer  "person_id"
    t.integer  "section_id"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  add_index "section_assignments", ["person_id"], :name => "index_section_assignments_on_person_id"
  add_index "section_assignments", ["section_id"], :name => "index_section_assignments_on_section_id"

  create_table "sections", :force => true do |t|
    t.integer  "course_id"
    t.integer  "school_id"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
    t.integer  "teacher_id"
    t.string   "name"
  end

  add_index "sections", ["course_id"], :name => "index_sections_on_course_id"
  add_index "sections", ["school_id"], :name => "index_sections_on_school_id"

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
