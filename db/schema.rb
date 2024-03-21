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

ActiveRecord::Schema[7.1].define(version: 2024_03_14_114031) do
  create_table "courses", force: :cascade do |t|
    t.string "name"
    t.boolean "is_archived", default: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "courses_people", id: false, force: :cascade do |t|
    t.integer "course_id", null: false
    t.integer "person_id", null: false
    t.string "classe"
    t.index ["course_id", "person_id"], name: "index_courses_people_on_course_id_and_person_id"
    t.index ["person_id", "course_id"], name: "index_courses_people_on_person_id_and_course_id"
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

  create_table "exams_people", id: false, force: :cascade do |t|
    t.integer "exam_id", null: false
    t.integer "person_id", null: false
    t.decimal "grade"
    t.index ["exam_id", "person_id"], name: "index_exams_people_on_exam_id_and_person_id"
    t.index ["person_id", "exam_id"], name: "index_exams_people_on_person_id_and_exam_id"
  end

  create_table "exams_semesters", id: false, force: :cascade do |t|
    t.integer "exam_id", null: false
    t.integer "semester_id", null: false
    t.index ["exam_id", "semester_id"], name: "index_exams_semesters_on_exam_id_and_semester_id"
    t.index ["semester_id", "exam_id"], name: "index_exams_semesters_on_semester_id_and_exam_id"
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
    t.integer "role_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["locality_id"], name: "index_people_on_locality_id"
    t.index ["role_id"], name: "index_people_on_role_id"
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

  add_foreign_key "exams", "courses"
  add_foreign_key "historics", "people", column: "people_id"
  add_foreign_key "people", "localities"
  add_foreign_key "people", "roles"
end
