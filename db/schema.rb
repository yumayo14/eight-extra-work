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

ActiveRecord::Schema.define(version: 20171221005617) do

  create_table "academies", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string "school_type"
    t.string "name"
    t.string "major"
    t.string "degree"
    t.date "from"
    t.date "to"
    t.bigint "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["user_id"], name: "index_academies_on_user_id"
  end

  create_table "cards", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string "image", null: false
    t.bigint "user_id"
    t.bigint "career_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["career_id"], name: "index_cards_on_career_id"
    t.index ["user_id"], name: "index_cards_on_user_id"
  end

  create_table "careers", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string "department"
    t.string "position"
    t.date "from"
    t.date "to"
    t.bigint "user_id"
    t.bigint "company_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["company_id"], name: "index_careers_on_company_id"
    t.index ["user_id"], name: "index_careers_on_user_id"
  end

  create_table "companies", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string "name", null: false
    t.string "url"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "telephone_types", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string "name"
    t.bigint "telephone_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["telephone_id"], name: "index_telephone_types_on_telephone_id"
  end

  create_table "telephones", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.integer "num"
    t.bigint "telephone_type_id"
    t.bigint "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["telephone_type_id"], name: "index_telephones_on_telephone_type_id"
    t.index ["user_id"], name: "index_telephones_on_user_id"

end
