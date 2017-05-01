class Reset < ActiveRecord::Migration[5.0]
  def change
    create_table "addresses", force: :cascade do |t|
      t.string   "line1"
      t.string   "line2"
      t.string   "city"
      t.string   "state"
      t.string   "zip"
      t.datetime "created_at", null: false
      t.datetime "updated_at", null: false
      t.integer  "borough"
    end

    create_table "censuses", force: :cascade do |t|
      t.integer  "shelter_building_id"
      t.integer  "count"
      t.datetime "created_at",          null: false
      t.datetime "updated_at",          null: false
      t.float    "utilization"
      t.string   "shelter_date"
      t.index ["shelter_building_id"], name: "index_censuses_on_shelter_building_id", using: :btree
    end

    create_table "floors", force: :cascade do |t|
      t.string   "name"
      t.integer  "shelter_building_id"
      t.datetime "created_at",          null: false
      t.datetime "updated_at",          null: false
      t.integer  "case_type_id"
      t.integer  "program_type_id"
      t.index ["shelter_building_id"], name: "index_floors_on_shelter_building_id", using: :btree
    end

    create_table "identifiers", force: :cascade do |t|
      t.string   "name"
      t.string   "type"
      t.string   "code"
      t.datetime "created_at", null: false
      t.datetime "updated_at", null: false
    end

    create_table "places", force: :cascade do |t|
      t.string   "name"
      t.string   "type"
      t.integer  "compartment_id"
      t.integer  "compartment_type"
      t.integer  "bed_count"
      t.datetime "created_at",       null: false
      t.datetime "updated_at",       null: false
      t.index ["compartment_id", "compartment_type"], name: "index_places_on_compartment_id_and_compartment_type", using: :btree
    end

    create_table "providers", force: :cascade do |t|
      t.string   "name"
      t.datetime "created_at", null: false
      t.datetime "updated_at", null: false
      t.string   "slug"
      t.index ["slug"], name: "index_providers_on_slug", using: :btree
    end

    create_table "shelter_buildings", force: :cascade do |t|
      t.string   "name"
      t.datetime "created_at",      null: false
      t.datetime "updated_at",      null: false
      t.integer  "address_id"
      t.integer  "surge_beds"
      t.integer  "shelter_id"
      t.datetime "date_opened"
      t.string   "slug"
      t.integer  "case_type_id"
      t.integer  "shelter_type_id"
      t.index ["address_id"], name: "index_shelter_buildings_on_address_id", using: :btree
      t.index ["shelter_id"], name: "index_shelter_buildings_on_shelter_id", using: :btree
    end

    create_table "shelters", force: :cascade do |t|
      t.string   "name"
      t.integer  "provider_id"
      t.datetime "created_at",  null: false
      t.datetime "updated_at",  null: false
      t.index ["provider_id"], name: "index_shelters_on_provider_id", using: :btree
    end

    create_table "users", force: :cascade do |t|
      t.string   "email",           null: false
      t.string   "password_digest", null: false
      t.datetime "created_at",      null: false
      t.datetime "updated_at",      null: false
      t.string   "name"
      t.index ["email"], name: "index_users_on_email", unique: true, using: :btree
    end
  end
end
