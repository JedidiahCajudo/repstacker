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

ActiveRecord::Schema[8.1].define(version: 2025_12_17_061958) do
  create_table "exercises", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.string "name"
    t.datetime "updated_at", null: false
    t.integer "workout_id", null: false
    t.index ["workout_id"], name: "index_exercises_on_workout_id"
  end

  create_table "work_sets", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.integer "exercise_id", null: false
    t.integer "reps"
    t.integer "set_number"
    t.datetime "updated_at", null: false
    t.integer "weight"
    t.index ["exercise_id"], name: "index_work_sets_on_exercise_id"
  end

  create_table "working_sets", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.integer "exercise_id", null: false
    t.integer "reps"
    t.datetime "updated_at", null: false
    t.float "weight"
    t.index ["exercise_id"], name: "index_working_sets_on_exercise_id"
  end

  create_table "workouts", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.date "date"
    t.datetime "updated_at", null: false
  end

  add_foreign_key "exercises", "workouts"
  add_foreign_key "work_sets", "exercises"
  add_foreign_key "working_sets", "exercises"
end
