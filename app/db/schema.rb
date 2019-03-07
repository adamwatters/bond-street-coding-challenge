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

ActiveRecord::Schema.define(version: 20170201222616) do

  create_table "step_sequences", force: :cascade do |t|
    t.integer "user_id"
    t.integer "current_step_index", default: 0
    t.index ["user_id"], name: "index_step_sequences_on_user_id"
  end

  create_table "steps", force: :cascade do |t|
    t.integer "step_sequence_id"
    t.string  "name"
    t.boolean "is_complete",      default: false
    t.integer "position"
    t.index ["step_sequence_id"], name: "index_steps_on_step_sequence_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "name"
    t.index ["name"], name: "index_users_on_name", unique: true
  end

end
