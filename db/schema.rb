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

ActiveRecord::Schema[7.1].define(version: 2024_03_24_092053) do
  create_table "classrooms", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "courses", force: :cascade do |t|
    t.string "name"
    t.boolean "is_archived", default: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "enrollments", force: :cascade do |t|
    t.integer "person_id", null: false
    t.integer "course_id", null: false
    t.index ["course_id"], name: "index_enrollments_on_course_id"
    t.index ["person_id"], name: "index_enrollments_on_person_id"
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

  create_table "exams_semesters", id: false, force: :cascade do |t|
    t.integer "exam_id", null: false
    t.integer "semester_id", null: false
  end

  create_table "grades", force: :cascade do |t|
    t.integer "person_id", null: false
    t.integer "exam_id", null: false
    t.decimal "grade"
    t.index ["exam_id"], name: "index_grades_on_exam_id"
    t.index ["person_id"], name: "index_grades_on_person_id"
  end

  create_table "historics", force: :cascade do |t|
    t.string "student_first_name"
    t.string "student_last_name"
    t.datetime "exam_date"
    t.string "exam_title"
    t.integer "grade"
    t.string "semester"
    t.integer "year"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
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

  add_foreign_key "enrollments", "courses"
  add_foreign_key "enrollments", "people"
  add_foreign_key "exams", "courses", on_delete: :cascade
  add_foreign_key "grades", "exams"
  add_foreign_key "grades", "people"
  add_foreign_key "people", "localities"
  add_foreign_key "people", "roles"
  add_foreign_key "placements", "classrooms"
  add_foreign_key "placements", "people"
end
