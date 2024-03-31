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

ActiveRecord::Schema[7.1].define(version: 2024_03_30_123811) do
  create_table "classrooms", force: :cascade do |t|
    t.date "promotion_start_date", null: false
    t.date "promotion_end_date", null: false
    t.string "name", limit: 45, null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "courses", force: :cascade do |t|
    t.string "name", limit: 255, null: false
    t.boolean "is_archived", default: false, null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "courses_semesters", id: false, force: :cascade do |t|
    t.integer "course_id", null: false
    t.integer "semester_id", null: false
  end

  create_table "enrollments", force: :cascade do |t|
    t.integer "classroom_id", null: false
    t.integer "course_id", null: false
    t.index ["classroom_id"], name: "index_enrollments_on_classroom_id"
    t.index ["course_id"], name: "index_enrollments_on_course_id"
  end

  create_table "exams", force: :cascade do |t|
    t.datetime "date", null: false
    t.string "title", limit: 100, null: false
    t.decimal "coefficient", null: false
    t.integer "course_id", null: false
    t.integer "semester_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["course_id"], name: "index_exams_on_course_id"
    t.index ["semester_id"], name: "index_exams_on_semester_id"
  end

  create_table "exams_semesters", id: false, force: :cascade do |t|
    t.integer "exam_id", null: false
    t.integer "semester_id", null: false
  end

  create_table "grades", force: :cascade do |t|
    t.integer "person_id", null: false
    t.integer "exam_id", null: false
    t.decimal "grade", precision: 3, scale: 2, null: false
    t.index ["exam_id"], name: "index_grades_on_exam_id"
    t.index ["person_id", "exam_id"], name: "index_grades_on_person_id_and_exam_id", unique: true
    t.index ["person_id"], name: "index_grades_on_person_id"
  end

  create_table "localities", force: :cascade do |t|
    t.string "ZIP", limit: 45, null: false
    t.string "locality", limit: 255, null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "people", force: :cascade do |t|
    t.string "gender", limit: 45, null: false
    t.string "first_name", limit: 255, null: false
    t.string "last_name", limit: 255, null: false
    t.datetime "birth_date", null: false
    t.string "address", limit: 255, null: false
    t.string "phone_number", limit: 45, null: false
    t.string "email", limit: 255, null: false
    t.integer "locality_id", null: false
    t.integer "role_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "encrypted_password", default: "", null: false
    t.datetime "remember_created_at"
    t.index ["email"], name: "index_people_on_email", unique: true
    t.index ["locality_id"], name: "index_people_on_locality_id"
    t.index ["role_id"], name: "index_people_on_role_id"
  end

  create_table "placements", force: :cascade do |t|
    t.integer "person_id", null: false
    t.integer "classroom_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["classroom_id"], name: "index_placements_on_classroom_id"
    t.index ["person_id"], name: "index_placements_on_person_id"
  end

  create_table "roles", force: :cascade do |t|
    t.string "role", limit: 45, null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "semesters", force: :cascade do |t|
    t.integer "number", null: false
    t.string "years", limit: 45, null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["number", "years"], name: "index_semesters_on_number_and_years", unique: true
  end

  add_foreign_key "enrollments", "classrooms"
  add_foreign_key "enrollments", "courses"
  add_foreign_key "exams", "courses", on_delete: :cascade
  add_foreign_key "exams", "semesters"
  add_foreign_key "grades", "exams"
  add_foreign_key "grades", "people"
  add_foreign_key "people", "localities"
  add_foreign_key "people", "roles"
  add_foreign_key "placements", "classrooms"
  add_foreign_key "placements", "people"
end
