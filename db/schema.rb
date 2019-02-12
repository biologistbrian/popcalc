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

ActiveRecord::Schema.define(version: 2019_02_11_164017) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "kernelperears", force: :cascade do |t|
    t.string "site"
    t.integer "avgkernelperear"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "projlines", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "pidtc"
    t.string "jobName"
    t.string "crop"
    t.string "traits"
    t.float "neisValue"
    t.float "targetRprecoveryThreshold"
    t.string "targetSelfingGen"
    t.integer "targetF3Material"
    t.string "nsSite"
    t.string "f1Site"
    t.string "bc1Site"
    t.string "bc2Site"
    t.string "bc3Site"
    t.string "bc4Site"
    t.string "f2Site"
    t.integer "traitNumber"
    t.float "f1RPrecovery"
    t.float "bc1Threshold"
    t.float "bc2Threshold"
    t.float "bc3Threshold"
    t.float "bc4Threshold"
    t.integer "nspop"
    t.integer "f1pop"
    t.integer "b1pop"
    t.integer "b2pop"
    t.integer "b3pop"
    t.integer "b4pop"
    t.integer "b5pop"
    t.float "certainty"
    t.integer "f2pop"
  end

  create_table "sitefactors", force: :cascade do |t|
    t.string "site"
    t.float "factor"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

end
