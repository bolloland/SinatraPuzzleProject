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

ActiveRecord::Schema.define(version: 2021_02_25_021032) do

  create_table "players", force: :cascade do |t|
    t.string "username"
    t.string "email"
    t.string "password"
    t.integer "team_id"
    t.integer "total_solved"
  end

  create_table "puzzles", force: :cascade do |t|
    t.string "title"
    t.string "type"
    t.string "solution"
    t.boolean "solved?"
  end

  create_table "solvers", id: false, force: :cascade do |t|
    t.string "player_id"
    t.string "puzzle_id"
  end

  create_table "teams", force: :cascade do |t|
    t.string "teamname"
    t.boolean "meta_solved?"
  end

end
