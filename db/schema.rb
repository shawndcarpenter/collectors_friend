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

ActiveRecord::Schema[7.1].define(version: 2024_02_16_172848) do
  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "collections", force: :cascade do |t|
    t.string "name"
    t.string "type"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "features", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "issue_features", force: :cascade do |t|
    t.bigint "issue_id", null: false
    t.bigint "feature_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["feature_id"], name: "index_issue_features_on_feature_id"
    t.index ["issue_id"], name: "index_issue_features_on_issue_id"
  end

  create_table "issues", force: :cascade do |t|
    t.string "collector_id"
    t.string "condition"
    t.date "date"
    t.string "origin"
    t.integer "status"
    t.float "price"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "collection_id", null: false
    t.string "title"
    t.index ["collection_id"], name: "index_issues_on_collection_id"
  end

  add_foreign_key "issue_features", "features"
  add_foreign_key "issue_features", "issues"
  add_foreign_key "issues", "collections"
end
