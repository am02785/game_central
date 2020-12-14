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

ActiveRecord::Schema.define(version: 2020_12_14_124459) do

  create_table "baskets", force: :cascade do |t|
    t.decimal "total_cost", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "customer_id", null: false
    t.index ["customer_id"], name: "index_baskets_on_customer_id"
  end

  create_table "customers", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["email"], name: "index_customers_on_email", unique: true
    t.index ["reset_password_token"], name: "index_customers_on_reset_password_token", unique: true
  end

  create_table "games", force: :cascade do |t|
    t.string "title", null: false
    t.text "description", null: false
    t.string "image_url", null: false
    t.decimal "price", null: false
    t.date "release_date", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "game_console", null: false
    t.string "search_input"
    t.index ["title"], name: "index_games_on_title", unique: true
  end

  create_table "line_items", force: :cascade do |t|
    t.integer "game_id", null: false
    t.integer "basket_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "order_id"
    t.date "delivery_date"
    t.index ["basket_id"], name: "index_line_items_on_basket_id"
    t.index ["game_id"], name: "index_line_items_on_game_id"
    t.index ["order_id"], name: "index_line_items_on_order_id"
  end

  create_table "orders", force: :cascade do |t|
    t.integer "customer_id", null: false
    t.string "name_on_credit_card", null: false
    t.string "CVV", null: false
    t.string "credit_card_number", null: false
    t.date "credit_card_valid_until", null: false
    t.decimal "total_cost", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["customer_id"], name: "index_orders_on_customer_id"
  end

end
