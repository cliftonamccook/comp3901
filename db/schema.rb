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

ActiveRecord::Schema.define(version: 2022_04_26_034456) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "campuses", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "courses", force: :cascade do |t|
    t.string "name"
    t.string "code"
    t.text "description"
    t.integer "credit_amount"
    t.integer "level"
    t.integer "semester_offered_in"
    t.boolean "discontinued", default: false
    t.bigint "department_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["department_id"], name: "index_courses_on_department_id"
  end

  create_table "departments", force: :cascade do |t|
    t.bigint "faculty_id", null: false
    t.string "name"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["faculty_id"], name: "index_departments_on_faculty_id"
  end

  create_table "faculties", force: :cascade do |t|
    t.bigint "campus_id", null: false
    t.string "name"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["campus_id"], name: "index_faculties_on_campus_id"
  end

  create_table "majors", force: :cascade do |t|
    t.string "name"
    t.bigint "programme_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["programme_id"], name: "index_majors_on_programme_id"
  end

  create_table "minors", force: :cascade do |t|
    t.string "name"
    t.bigint "programme_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["programme_id"], name: "index_minors_on_programme_id"
  end

  create_table "permission_groups", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "permissions", force: :cascade do |t|
    t.bigint "department_id", null: false
    t.bigint "permission_group_id", null: false
    t.boolean "can_create"
    t.boolean "can_update"
    t.boolean "can_discontinue"
    t.boolean "can_view"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["department_id"], name: "index_permissions_on_department_id"
    t.index ["permission_group_id"], name: "index_permissions_on_permission_group_id"
  end

  create_table "programmes", force: :cascade do |t|
    t.string "name"
    t.bigint "department_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["department_id"], name: "index_programmes_on_department_id"
  end

  create_table "requirement_groups", force: :cascade do |t|
    t.string "name"
    t.string "requirement_groupable_type", null: false
    t.bigint "requirement_groupable_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["requirement_groupable_type", "requirement_groupable_id"], name: "index_requirement_groups_on_requirement_groupable"
  end

  create_table "requirements", force: :cascade do |t|
    t.bigint "requirement_group_id", null: false
    t.integer "operation"
    t.integer "minimum_amount_of_credits"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.bigint "course_ids", array: true
    t.index ["requirement_group_id"], name: "index_requirements_on_requirement_group_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.bigint "campus_id"
    t.string "title"
    t.string "first_name"
    t.string "middle_names"
    t.string "last_name"
    t.string "gender"
    t.integer "account_status", default: 0
    t.integer "account_type"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.integer "uwi_id"
    t.bigint "permission_group_id"
    t.index ["campus_id"], name: "index_users_on_campus_id"
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  add_foreign_key "courses", "departments"
  add_foreign_key "departments", "faculties"
  add_foreign_key "faculties", "campuses"
  add_foreign_key "majors", "programmes"
  add_foreign_key "minors", "programmes"
  add_foreign_key "permissions", "departments"
  add_foreign_key "permissions", "permission_groups"
  add_foreign_key "programmes", "departments"
  add_foreign_key "requirements", "requirement_groups"
  add_foreign_key "users", "campuses"
end
