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

ActiveRecord::Schema[7.1].define(version: 2024_02_08_103722) do
  create_table "courses", force: :cascade do |t|
    t.string "name"
    t.boolean "is_archived", default: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "exams", force: :cascade do |t|
    t.datetime "date"
    t.string "title"
    t.decimal "coefficient"
    t.integer "course_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["course_id"], name: "index_exams_on_course_id"
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
    t.string "ZIP"
    t.string "locality"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "people", force: :cascade do |t|
    t.string "gender"
    t.string "first_name"
    t.string "last_name"
    t.datetime "birth_date"
    t.string "address"
    t.string "phone_number"
    t.string "email"
    t.integer "locality_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["locality_id"], name: "index_people_on_locality_id"
  end

  create_table "people_has_exams", force: :cascade do |t|
    t.integer "person_id"
    t.integer "exam_id"
    t.decimal "grade"
    t.index ["exam_id"], name: "index_people_has_exams_on_exam_id"
    t.index ["person_id"], name: "index_people_has_exams_on_person_id"
  end

  create_table "people_has_subjects", force: :cascade do |t|
    t.integer "person_id"
    t.integer "course_id"
    t.string "classe", null: false
    t.index ["course_id"], name: "index_people_has_subjects_on_course_id"
    t.index ["person_id"], name: "index_people_has_subjects_on_person_id"
  end

  create_table "roles", force: :cascade do |t|
    t.string "role"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "semesters", force: :cascade do |t|
    t.integer "number"
    t.string "years"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "semesters_has_exams", force: :cascade do |t|
    t.integer "semester_id"
    t.integer "exam_id"
    t.index ["exam_id"], name: "index_semesters_has_exams_on_exam_id"
    t.index ["semester_id"], name: "index_semesters_has_exams_on_semester_id"
  end

  add_foreign_key "exams", "courses"
  add_foreign_key "historics", "people", column: "people_id"
  add_foreign_key "people", "localities"
  add_foreign_key "people_has_exams", "exams"
  add_foreign_key "people_has_exams", "people"
  add_foreign_key "people_has_subjects", "courses"
  add_foreign_key "people_has_subjects", "people"
  add_foreign_key "semesters_has_exams", "exams"
  add_foreign_key "semesters_has_exams", "semesters"
end
