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

ActiveRecord::Schema.define(version: 20161128205945) do

  create_table "customer", primary_key: "customer_id", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.integer "person_id", null: false
    t.index ["customer_id"], name: "customer_id_UNIQUE", unique: true, using: :btree
    t.index ["person_id"], name: "fk_Customer_Person1_idx", using: :btree
  end

  create_table "customers", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=latin1" do |t|
    t.integer  "customer_id"
    t.integer  "person_id"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

  create_table "email", primary_key: "email_id", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string  "email_name",   limit: 45, null: false
    t.string  "email_domain", limit: 15, null: false
    t.integer "person_id",               null: false
    t.index ["email_id"], name: "email_id_UNIQUE", unique: true, using: :btree
    t.index ["person_id"], name: "fk_Email_Person1_idx", using: :btree
  end

  create_table "emails", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=latin1" do |t|
    t.integer  "email_id"
    t.string   "email_name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "employee", primary_key: "employee_id", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.date    "date_hired",                          null: false
    t.decimal "wage",        precision: 7, scale: 2, null: false
    t.integer "person_id",                           null: false
    t.integer "position_id",                         null: false
    t.integer "status_id",                           null: false
    t.index ["employee_id"], name: "employee_id_UNIQUE", unique: true, using: :btree
    t.index ["person_id"], name: "fk_Employee_Person1_idx", using: :btree
    t.index ["position_id"], name: "fk_Employee_Position1_idx", using: :btree
    t.index ["status_id"], name: "fk_Employee_status1_idx", using: :btree
  end

  create_table "employee_has_shift", primary_key: ["employee_id", "shift_id"], force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.integer "employee_id", null: false
    t.integer "shift_id",    null: false
    t.index ["employee_id"], name: "fk_Employee_has_shift_Employee1_idx", using: :btree
    t.index ["shift_id"], name: "fk_Employee_has_shift_shift1_idx", using: :btree
  end

  create_table "employee_has_shifts", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=latin1" do |t|
    t.integer  "employee_id"
    t.integer  "shift_id"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

  create_table "employees", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=latin1" do |t|
    t.integer  "employee_id"
    t.date     "date_hired"
    t.decimal  "wage",        precision: 8, scale: 2
    t.integer  "person_id"
    t.integer  "postion_id"
    t.integer  "status_id"
    t.datetime "created_at",                          null: false
    t.datetime "updated_at",                          null: false
  end

  create_table "invoice", primary_key: "invoice_id", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.datetime "invoice_time", null: false
    t.integer  "employee_id",  null: false
    t.integer  "customer_id",  null: false
    t.index ["customer_id"], name: "fk_invoice_Customer1_idx", using: :btree
    t.index ["employee_id"], name: "fk_invoice_Employee1_idx", using: :btree
    t.index ["invoice_id"], name: "invoice_id_UNIQUE", unique: true, using: :btree
  end

  create_table "invoice_has_product", primary_key: ["invoice_id", "product_id"], force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.integer "invoice_id",       null: false
    t.integer "product_id",       null: false
    t.integer "product_quantity", null: false
    t.index ["invoice_id"], name: "fk_invoice_has_Product_invoice_idx", using: :btree
    t.index ["product_id"], name: "fk_invoice_has_Product_Product1_idx", using: :btree
  end

  create_table "invoices", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=latin1" do |t|
    t.integer  "invoice_id"
    t.datetime "invoice_time"
    t.integer  "employee_id"
    t.integer  "customer_id"
    t.datetime "created_at",   null: false
    t.datetime "updated_at",   null: false
  end

  create_table "people", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=latin1" do |t|
    t.integer  "person_id"
    t.string   "person_first_name"
    t.string   "person_last_name"
    t.datetime "created_at",        null: false
    t.datetime "updated_at",        null: false
  end

  create_table "person", primary_key: "person_id", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string "person_first_name", limit: 35, null: false
    t.string "person_last_name",  limit: 35, null: false
    t.index ["person_id"], name: "customer_id_UNIQUE", unique: true, using: :btree
  end

  create_table "phone", primary_key: "phone_id", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string  "phone_area_code",          limit: 3, null: false
    t.string  "phone_telephone_exchange", limit: 3, null: false
    t.string  "phone_assigned_number",    limit: 4, null: false
    t.integer "person_id",                          null: false
    t.index ["person_id"], name: "fk_Phone_Person1_idx", using: :btree
    t.index ["phone_id"], name: "phone_id_UNIQUE", unique: true, using: :btree
  end

  create_table "phones", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=latin1" do |t|
    t.integer  "phone_id"
    t.string   "phone_area_code"
    t.string   "phone_telephone_exchange"
    t.string   "phone_assigned_number"
    t.integer  "person_id"
    t.datetime "created_at",               null: false
    t.datetime "updated_at",               null: false
  end

  create_table "position", primary_key: "position_id", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string "position_name", limit: 25, null: false
    t.index ["position_id"], name: "position_id_UNIQUE", unique: true, using: :btree
  end

  create_table "positions", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=latin1" do |t|
    t.integer  "position_id"
    t.string   "position_name"
    t.datetime "created_at",    null: false
    t.datetime "updated_at",    null: false
  end

  create_table "product", primary_key: "product_id", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string  "product_name",        limit: 45,                          null: false
    t.string  "product_description", limit: 140,                         null: false
    t.decimal "product_price",                   precision: 7, scale: 2, null: false
  end

  create_table "products", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=latin1" do |t|
    t.integer  "product_id"
    t.string   "product_name"
    t.string   "product_description"
    t.decimal  "product_price",       precision: 8, scale: 2
    t.datetime "created_at",                                  null: false
    t.datetime "updated_at",                                  null: false
  end

  create_table "shift", primary_key: "shift_id", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string "shift_time", limit: 15, null: false
    t.index ["shift_id"], name: "shift_id_UNIQUE", unique: true, using: :btree
  end

  create_table "shifts", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=latin1" do |t|
    t.integer  "shift_id"
    t.string   "shift_time"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "status", primary_key: "status_id", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string "status_type", limit: 10, null: false
    t.index ["status_id"], name: "status_id_UNIQUE", unique: true, using: :btree
  end

  create_table "statuses", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=latin1" do |t|
    t.integer  "status_id"
    t.string   "status_type"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

  create_table "users", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=latin1" do |t|
    t.string   "name"
    t.string   "email"
    t.string   "password_digest"
    t.datetime "created_at",      null: false
    t.datetime "updated_at",      null: false
  end

  add_foreign_key "customer", "person", primary_key: "person_id", name: "fk_Customer_Person1"
  add_foreign_key "email", "person", primary_key: "person_id", name: "fk_Email_Person1"
  add_foreign_key "employee", "person", primary_key: "person_id", name: "fk_Employee_Person1"
  add_foreign_key "employee", "position", primary_key: "position_id", name: "fk_Employee_Position1"
  add_foreign_key "employee", "status", primary_key: "status_id", name: "fk_Employee_status1"
  add_foreign_key "employee_has_shift", "employee", primary_key: "employee_id", name: "fk_Employee_has_shift_Employee1"
  add_foreign_key "employee_has_shift", "shift", primary_key: "shift_id", name: "fk_Employee_has_shift_shift1"
  add_foreign_key "invoice", "customer", primary_key: "customer_id", name: "fk_invoice_Customer1"
  add_foreign_key "invoice", "employee", primary_key: "employee_id", name: "fk_invoice_Employee1"
  add_foreign_key "invoice_has_product", "invoice", primary_key: "invoice_id", name: "fk_invoice_has_Product_invoice"
  add_foreign_key "invoice_has_product", "product", primary_key: "product_id", name: "fk_invoice_has_Product_Product1"
  add_foreign_key "phone", "person", primary_key: "person_id", name: "fk_Phone_Person1"
end
