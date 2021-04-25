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

ActiveRecord::Schema.define(version: 2021_04_24_221536) do

  create_table "nodes", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.string "name"
    t.string "kind"
    t.string "ipaddress"
    t.string "hostname"
    t.boolean "deleted", default: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "operations", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.integer "operation_type"
    t.bigint "user_id"
    t.bigint "node_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["node_id"], name: "index_operations_on_node_id"
    t.index ["user_id"], name: "index_operations_on_user_id"
  end

  create_table "users", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.string "name"
    t.string "email"
    t.string "password_digest"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_foreign_key "operations", "nodes"
  add_foreign_key "operations", "users"
end
