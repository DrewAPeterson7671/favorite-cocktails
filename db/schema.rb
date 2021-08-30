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

ActiveRecord::Schema.define(version: 2021_08_29_212144) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "cocktails", force: :cascade do |t|
    t.string "name"
    t.text "ingredients"
    t.integer "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "api_id_drink"
    t.string "category"
    t.string "alcoholic"
    t.string "glass"
    t.text "instructions"
    t.string "api_image_url"
    t.string "ingredient1"
    t.string "ingredient2"
    t.string "ingredient3"
    t.string "ingredient4"
    t.string "ingredient5"
    t.string "ingredient6"
    t.string "ingredient7"
    t.string "ingredient8"
    t.string "ingredient9"
    t.string "ingredient10"
    t.string "ingredient11"
    t.string "ingredient12"
    t.string "ingredient13"
    t.string "ingredient14"
    t.string "ingredient15"
    t.string "measure1"
    t.string "measure2"
    t.string "measure3"
    t.string "measure4"
    t.string "measure5"
    t.string "measure6"
    t.string "measure7"
    t.string "measure8"
    t.string "measure9"
    t.string "measure10"
    t.string "measure11"
    t.string "measure12"
    t.string "measure13"
    t.string "measure14"
    t.string "measure15"
  end

  create_table "users", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "username"
    t.boolean "admin", default: false
    t.string "confirmation_token"
    t.datetime "confirmed_at"
    t.datetime "confirmation_sent_at"
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

end
