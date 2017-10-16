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

ActiveRecord::Schema.define(version: 20171016025405) do

  create_table "comments", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.text     "text",              limit: 65535
    t.integer  "hanghoa_id"
    t.integer  "nguoilap_id"
    t.datetime "created_at",                      null: false
    t.datetime "updated_at",                      null: false
    t.integer  "state_id"
    t.integer  "previous_state_id"
    t.index ["hanghoa_id"], name: "index_comments_on_hanghoa_id", using: :btree
    t.index ["nguoilap_id"], name: "index_comments_on_nguoilap_id", using: :btree
    t.index ["previous_state_id"], name: "index_comments_on_previous_state_id", using: :btree
    t.index ["state_id"], name: "index_comments_on_state_id", using: :btree
  end

  create_table "cuoccpns", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.integer  "muccuoc"
    t.integer  "vung_id"
    t.integer  "dichvu_id"
    t.integer  "nackhoiluong_id"
    t.datetime "created_at",      null: false
    t.datetime "updated_at",      null: false
    t.index ["dichvu_id"], name: "index_cuoccpns_on_dichvu_id", using: :btree
    t.index ["nackhoiluong_id"], name: "index_cuoccpns_on_nackhoiluong_id", using: :btree
    t.index ["vung_id"], name: "index_cuoccpns_on_vung_id", using: :btree
  end

  create_table "dichvucongthems", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string   "tendvct"
    t.text     "mota",       limit: 65535
    t.integer  "mcdvct"
    t.datetime "created_at",               null: false
    t.datetime "updated_at",               null: false
  end

  create_table "dichvus", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string   "tendv"
    t.text     "mota",       limit: 65535
    t.float    "tylegiatri", limit: 24,    default: 1.0
    t.datetime "created_at",                             null: false
    t.datetime "updated_at",                             null: false
    t.integer  "table_id"
    t.index ["table_id"], name: "index_dichvus_on_table_id", using: :btree
  end

  create_table "hanghoas", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.float    "trongluongtinh",    limit: 24
    t.float    "trongluongquydoi",  limit: 24
    t.float    "chieudai",          limit: 24
    t.float    "chieucao",          limit: 24
    t.float    "chieurong",         limit: 24
    t.text     "motachitiet",       limit: 65535
    t.integer  "cuocchinh"
    t.integer  "cuocphu"
    t.integer  "tongcuoc"
    t.datetime "created_at",                      null: false
    t.datetime "updated_at",                      null: false
    t.integer  "vandon_id"
    t.integer  "dichvu_id"
    t.integer  "dichvucongthem_id"
    t.integer  "state_id"
    t.index ["dichvu_id"], name: "index_hanghoas_on_dichvu_id", using: :btree
    t.index ["dichvucongthem_id"], name: "index_hanghoas_on_dichvucongthem_id", using: :btree
    t.index ["state_id"], name: "index_hanghoas_on_state_id", using: :btree
    t.index ["vandon_id"], name: "index_hanghoas_on_vandon_id", using: :btree
  end

  create_table "khachhangs", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string   "hotenkh"
    t.string   "sodt"
    t.string   "address"
    t.string   "sub_state"
    t.string   "city"
    t.string   "province"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer  "vandon_id"
    t.string   "longitude"
    t.string   "latitude"
    t.index ["vandon_id"], name: "index_khachhangs_on_vandon_id", using: :btree
  end

  create_table "loaihangs", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string   "tenlh"
    t.text     "mota",       limit: 65535
    t.datetime "created_at",               null: false
    t.datetime "updated_at",               null: false
  end

  create_table "nackhoiluongs", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string   "tennkl"
    t.string   "mota"
    t.datetime "created_at",             null: false
    t.datetime "updated_at",             null: false
    t.float    "khoiluongbd", limit: 24
    t.float    "khoiluongkt", limit: 24
  end

  create_table "nguoinhans", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string   "hotennn"
    t.string   "sodtnn"
    t.string   "address"
    t.string   "city"
    t.string   "province"
    t.string   "sub_state"
    t.string   "longitude"
    t.string   "latitude"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer  "vandon_id"
    t.integer  "tinh_id"
    t.index ["tinh_id"], name: "index_nguoinhans_on_tinh_id", using: :btree
    t.index ["vandon_id"], name: "index_nguoinhans_on_vandon_id", using: :btree
  end

  create_table "roles", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.integer  "user_id"
    t.string   "role"
    t.integer  "loaihang_id"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
    t.index ["loaihang_id"], name: "index_roles_on_loaihang_id", using: :btree
    t.index ["user_id"], name: "index_roles_on_user_id", using: :btree
  end

  create_table "states", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string "name"
    t.string "color"
  end

  create_table "tables", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string   "name"
    t.text     "mota",       limit: 65535
    t.datetime "created_at",               null: false
    t.datetime "updated_at",               null: false
  end

  create_table "tinhs", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string   "tentinh"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer  "vung_id"
    t.index ["vung_id"], name: "index_tinhs_on_vung_id", using: :btree
  end

  create_table "users", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string   "email",                  default: "",    null: false
    t.string   "encrypted_password",     default: "",    null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          default: 0,     null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.datetime "created_at",                             null: false
    t.datetime "updated_at",                             null: false
    t.boolean  "admin",                  default: false
    t.datetime "archived_at"
    t.string   "hoten"
    t.string   "diachi"
    t.string   "sdt"
    t.boolean  "nhanvien",               default: false
    t.index ["email"], name: "index_users_on_email", unique: true, using: :btree
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true, using: :btree
  end

  create_table "vandons", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
    t.string   "mota"
    t.integer  "nguoilap_id"
    t.index ["nguoilap_id"], name: "index_vandons_on_nguoilap_id", using: :btree
  end

  create_table "vungs", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string   "tenvung"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_foreign_key "comments", "hanghoas"
  add_foreign_key "comments", "states"
  add_foreign_key "comments", "states", column: "previous_state_id"
  add_foreign_key "comments", "users", column: "nguoilap_id"
  add_foreign_key "cuoccpns", "dichvus"
  add_foreign_key "cuoccpns", "nackhoiluongs"
  add_foreign_key "cuoccpns", "vungs"
  add_foreign_key "dichvus", "tables"
  add_foreign_key "hanghoas", "dichvucongthems"
  add_foreign_key "hanghoas", "dichvus"
  add_foreign_key "hanghoas", "states"
  add_foreign_key "hanghoas", "vandons"
  add_foreign_key "khachhangs", "vandons"
  add_foreign_key "nguoinhans", "tinhs"
  add_foreign_key "nguoinhans", "vandons"
  add_foreign_key "roles", "loaihangs"
  add_foreign_key "roles", "users"
  add_foreign_key "tinhs", "vungs"
  add_foreign_key "vandons", "users", column: "nguoilap_id"
end
