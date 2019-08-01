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

ActiveRecord::Schema.define(version: 2019_08_01_030015) do

  create_table "addresses", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.string "street"
    t.string "city"
    t.bigint "province_id"
    t.string "postal_code"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["province_id"], name: "index_addresses_on_province_id"
  end

  create_table "districts", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.string "name"
    t.bigint "election_type_id"
    t.bigint "jurisdiction_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["election_type_id"], name: "index_districts_on_election_type_id"
    t.index ["jurisdiction_id"], name: "index_districts_on_jurisdiction_id"
  end

  create_table "districts_elections", id: false, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.bigint "election_id", null: false
    t.bigint "district_id", null: false
    t.index ["district_id", "election_id"], name: "index_districts_elections_on_district_id_and_election_id"
    t.index ["election_id", "district_id"], name: "index_districts_elections_on_election_id_and_district_id"
  end

  create_table "election_types", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "elections", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.string "name"
    t.datetime "election_date"
    t.bigint "election_type_id"
    t.bigint "jurisdiction_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.boolean "active", default: false
    t.index ["election_type_id"], name: "index_elections_on_election_type_id"
    t.index ["jurisdiction_id"], name: "index_elections_on_jurisdiction_id"
  end

  create_table "history_types", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "jurisdictions", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "participants", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.bigint "user_id"
    t.string "email"
    t.string "website"
    t.text "biography"
    t.boolean "is_incumbent"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "phone"
    t.boolean "is_candidate"
    t.bigint "address_id"
    t.bigint "district_id"
    t.bigint "party_id"
    t.bigint "leader_participant_id"
    t.index ["address_id"], name: "index_participants_on_address_id"
    t.index ["district_id"], name: "index_participants_on_district_id"
    t.index ["leader_participant_id"], name: "fk_rails_de8d82c2c8"
    t.index ["party_id"], name: "index_participants_on_party_id"
    t.index ["user_id"], name: "index_participants_on_user_id"
  end

  create_table "parties", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.string "name"
    t.string "name_abbreviation"
    t.string "alternate_name"
    t.string "alternate_abbreviation"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "provinces", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "social_media_profiles", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.string "handle"
    t.bigint "participant_id"
    t.bigint "social_media_type_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["participant_id"], name: "index_social_media_profiles_on_participant_id"
    t.index ["social_media_type_id"], name: "index_social_media_profiles_on_social_media_type_id"
  end

  create_table "social_media_types", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "user_types", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "users", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.string "first_name"
    t.string "last_name"
    t.string "email"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "user_type_id"
    t.string "password_digest"
    t.string "remember_digest"
    t.string "activation_digest"
    t.boolean "activated", default: false
    t.datetime "activated_at"
    t.string "reset_digest"
    t.datetime "reset_sent_at"
    t.index ["email"], name: "index_users_on_email", unique: true
  end

  add_foreign_key "addresses", "provinces"
  add_foreign_key "districts", "election_types"
  add_foreign_key "districts", "jurisdictions"
  add_foreign_key "elections", "election_types"
  add_foreign_key "elections", "jurisdictions"
  add_foreign_key "participants", "addresses"
  add_foreign_key "participants", "districts"
  add_foreign_key "participants", "participants", column: "leader_participant_id"
  add_foreign_key "participants", "parties"
  add_foreign_key "participants", "users"
  add_foreign_key "social_media_profiles", "participants"
  add_foreign_key "social_media_profiles", "social_media_types"
end
