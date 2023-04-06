# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# This file is the source Rails uses to define your schema when running `bin/rails
# db:schema:load`. When creating a new database, `bin/rails db:schema:load` tends to
# be faster and is potentially less error prone than running all of your
# migrations from scratch. Old migrations may fail to apply correctly if those
# migrations use external dependencies or application code.
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema[7.0].define(version: 2023_04_06_163129) do
  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "categories", force: :cascade do |t|
    t.string "name"
    t.text "description"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "category_id", null: false
    t.index ["category_id"], name: "index_categories_on_category_id"
  end

  create_table "colors", force: :cascade do |t|
    t.string "name"
    t.bigint "product_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["product_id"], name: "index_colors_on_product_id"
  end

  create_table "customers", force: :cascade do |t|
    t.string "first_name"
    t.string "second_name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.boolean "admin", default: false
    t.index ["email"], name: "index_customers_on_email", unique: true
    t.index ["reset_password_token"], name: "index_customers_on_reset_password_token", unique: true
  end

  create_table "customers_products", id: false, force: :cascade do |t|
    t.bigint "customer_id"
    t.bigint "product_id"
    t.index ["customer_id"], name: "index_customers_products_on_customer_id"
    t.index ["product_id"], name: "index_customers_products_on_product_id"
  end

  create_table "images", force: :cascade do |t|
    t.string "name"
    t.string "url"
    t.bigint "product_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["product_id"], name: "index_images_on_product_id"
  end

  create_table "products", force: :cascade do |t|
    t.string "name"
    t.string "image"
    t.string "description"
    t.integer "original_price"
    t.integer "selling_price"
    t.integer "rating"
    t.boolean "in_stock"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.boolean "in_wishlist", default: false
    t.boolean "recommended", default: false
    t.bigint "category_id", null: false
    t.index ["category_id"], name: "index_products_on_category_id"
  end

  create_table "sizes", force: :cascade do |t|
    t.string "name"
    t.text "description"
    t.bigint "product_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["product_id"], name: "index_sizes_on_product_id"
  end

  add_foreign_key "categories", "categories"
  add_foreign_key "colors", "products"
  add_foreign_key "images", "products"
  add_foreign_key "products", "categories"
  add_foreign_key "sizes", "products"
end
