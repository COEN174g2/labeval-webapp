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

ActiveRecord::Schema.define(version: 2019_11_05_044223) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "answers", force: :cascade do |t|
    t.integer "choice"
    t.string "text"
    t.bigint "response_id"
    t.bigint "question_id"
    t.bigint "student_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["question_id"], name: "index_answers_on_question_id"
    t.index ["response_id"], name: "index_answers_on_response_id"
    t.index ["student_id"], name: "index_answers_on_student_id"
  end

  create_table "professors", force: :cascade do |t|
    t.string "name"
    t.string "password_digest"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "qs", force: :cascade do |t|
    t.bigint "student_id"
    t.bigint "questionnaire_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["questionnaire_id"], name: "index_qs_on_questionnaire_id"
    t.index ["student_id"], name: "index_qs_on_student_id"
  end

  create_table "questionnaires", force: :cascade do |t|
    t.string "cid"
    t.string "name"
    t.bigint "professor_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "pname"
    t.index ["cid", "pname"], name: "index_questionnaires_on_cid_and_pname", unique: true
    t.index ["professor_id"], name: "index_questionnaires_on_professor_id"
  end

  create_table "questions", force: :cascade do |t|
    t.string "description"
    t.bigint "questionnaire_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "q_type"
    t.index ["questionnaire_id"], name: "index_questions_on_questionnaire_id"
  end

  create_table "responses", force: :cascade do |t|
    t.string "cid"
    t.bigint "student_id"
    t.bigint "questionnaire_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["questionnaire_id", "student_id"], name: "index_responses_on_questionnaire_id_and_student_id", unique: true
    t.index ["questionnaire_id"], name: "index_responses_on_questionnaire_id"
    t.index ["student_id"], name: "index_responses_on_student_id"
  end

  create_table "students", force: :cascade do |t|
    t.string "studentid"
    t.string "password_digest"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_foreign_key "answers", "questions"
  add_foreign_key "answers", "responses"
  add_foreign_key "answers", "students"
  add_foreign_key "qs", "questionnaires"
  add_foreign_key "qs", "students"
  add_foreign_key "questionnaires", "professors"
  add_foreign_key "questions", "questionnaires"
  add_foreign_key "responses", "questionnaires"
  add_foreign_key "responses", "students"
end
