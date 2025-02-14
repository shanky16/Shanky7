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

ActiveRecord::Schema.define(version: 20170417085937) do

  create_table "assigns", force: :cascade do |t|
    t.integer  "user_id"
    t.integer  "project_id"
    t.string   "status",     default: "Incomplete"
    t.datetime "created_at",                        null: false
    t.datetime "updated_at",                        null: false
    t.index ["project_id"], name: "index_assigns_on_project_id"
    t.index ["user_id"], name: "index_assigns_on_user_id"
  end

  create_table "projects", force: :cascade do |t|
    t.string   "name",                                         null: false
    t.string   "requirements"
    t.string   "domain"
    t.string   "final_status",          default: "Incomplete"
    t.integer  "user_id"
    # t.string   "avatar_file_name"
    # t.string   "avatar_content_type"
    # t.integer  "avatar_file_size"
    # t.datetime "avatar_updated_at"
    # t.string   "document_file_name"
    # t.string   "document_content_type"
    # t.integer  "document_file_size"
    # t.datetime "document_updated_at"
    t.index ["user_id"], name: "index_projects_on_user_id"
  end

  create_table "users", force: :cascade do |t|
    t.string   "email",                  default: "", null: false
    t.string   "encrypted_password",     default: "", null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.datetime "created_at",                          null: false
    t.datetime "updated_at",                          null: false
    t.string   "role"
    t.string   "name"
    t.string   "provider"
    t.string   "uid"
    t.string   "confirmation_token"
    t.datetime "confirmed_at"
    t.datetime "confirmation_sent_at"
    t.string   "unconfirmed_email"
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

end
