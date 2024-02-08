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

ActiveRecord::Schema[7.1].define(version: 2024_02_08_074801) do
  create_table "exams", force: :cascade do |t|
    t.datetime "date"
    t.string "title"
    t.decimal "coefficient"
    t.integer "subject_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["subject_id"], name: "index_exams_on_subject_id"
  end

  create_table "historics", force: :cascade do |t|
    t.datetime "start_date"
    t.datetime "end_date"
    t.string "status"
    t.string "class_name"
    t.integer "people_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["people_id"], name: "index_historics_on_people_id"
  end

  create_table "localities", force: :cascade do |t|
    t.text "ZIP"
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "people", force: :cascade do |t|
    t.string "gender"
    t.text "first_name"
    t.text "last_name"
    t.datetime "birth_date"
    t.text "address"
    t.string "phone_number"
    t.text "email"
    t.boolean "is_teacher"
    t.integer "locality_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["locality_id"], name: "index_people_on_locality_id"
  end

  create_table "semesters", force: :cascade do |t|
    t.integer "number"
    t.string "years"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "subjects", force: :cascade do |t|
    t.string "subject"
    t.decimal "coefficient"
    t.string "status"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_foreign_key "exams", "subjects"
  add_foreign_key "historics", "people", column: "people_id"
  add_foreign_key "people", "localities"
end
