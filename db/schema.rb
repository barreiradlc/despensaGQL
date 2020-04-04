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

ActiveRecord::Schema.define(version: 2020_04_03_170433) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "despensas", force: :cascade do |t|
    t.string "nome"
    t.string "descricao"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "despensas_users", id: false, force: :cascade do |t|
    t.bigint "user_id"
    t.bigint "despensa_id"
    t.index ["despensa_id"], name: "index_despensas_users_on_despensa_id"
    t.index ["user_id"], name: "index_despensas_users_on_user_id"
  end

  create_table "items", force: :cascade do |t|
    t.bigint "user_id"
    t.bigint "provimento_id"
    t.bigint "despensa_id"
    t.integer "quantidade"
    t.date "validade"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["despensa_id"], name: "index_items_on_despensa_id"
    t.index ["provimento_id"], name: "index_items_on_provimento_id"
    t.index ["user_id"], name: "index_items_on_user_id"
  end

  create_table "passos", force: :cascade do |t|
    t.string "descricao"
    t.string "posicao"
    t.bigint "receita_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["receita_id"], name: "index_passos_on_receita_id"
  end

  create_table "provimentos", force: :cascade do |t|
    t.string "nome"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "receita", force: :cascade do |t|
    t.string "nome"
    t.string "descricao"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "users", force: :cascade do |t|
    t.string "first_name"
    t.string "last_name"
    t.string "email"
    t.string "username"
    t.string "password_digest"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  add_foreign_key "items", "despensas"
  add_foreign_key "items", "provimentos"
  add_foreign_key "items", "users"
  add_foreign_key "passos", "receita", column: "receita_id"
end
