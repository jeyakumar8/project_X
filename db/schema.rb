# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# This file is the source Rails uses to define your schema when running `rails
# db:schema:load`. When creating a new database, `rails db:schema:load` tends to
# be faster and is potentially less error prone than running all of your
# migrations from scratch. Old migrations may fail to apply correctly if those
# migrations use external dependencies or application code.
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 2020_01_04_152001) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "drivers", force: :cascade do |t|
    t.string "name"
    t.boolean "available"
  end

  create_table "products", force: :cascade do |t|
    t.integer "name"
  end

  create_table "stores", force: :cascade do |t|
    t.integer "store_name"
    t.string "latitude"
    t.string "longitude"
    t.string "s_eta"
  end

  create_table "stores_drivers", force: :cascade do |t|
    t.integer "driver_id"
    t.integer "store_id"
    t.string "eta"
  end

  create_table "stores_products", force: :cascade do |t|
    t.integer "product_id"
    t.integer "store_id"
    t.string "product_rating"
  end

end
