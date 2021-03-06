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

ActiveRecord::Schema.define(version: 20161020061854) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "accounting_bank_branches", force: :cascade do |t|
    t.string   "display_name"
    t.integer  "accounting_bank_id"
    t.datetime "created_at",         null: false
    t.datetime "updated_at",         null: false
    t.index ["accounting_bank_id"], name: "index_accounting_bank_branches_on_accounting_bank_id", using: :btree
  end

  create_table "accounting_banks", force: :cascade do |t|
    t.string   "code"
    t.string   "display_name"
    t.datetime "created_at",   null: false
    t.datetime "updated_at",   null: false
  end

  create_table "accounting_company_bank_accounts", force: :cascade do |t|
    t.string   "code"
    t.string   "display_name"
    t.integer  "accounting_bank_branch_id"
    t.datetime "created_at",                null: false
    t.datetime "updated_at",                null: false
    t.index ["accounting_bank_branch_id"], name: "index_bank_branch_on_company_accounts", using: :btree
  end

  create_table "customer_customers", force: :cascade do |t|
    t.string   "first_name",       null: false
    t.string   "last_name",        null: false
    t.string   "nickname"
    t.string   "telephone_number"
    t.string   "mobile_number"
    t.integer  "staff_id"
    t.datetime "created_at",       null: false
    t.datetime "updated_at",       null: false
    t.index ["staff_id"], name: "index_customer_customers_on_staff_id", using: :btree
  end

  create_table "distributors", force: :cascade do |t|
    t.string   "encrypted_password",                 default: "",  null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",                      default: 0,   null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.string   "confirmation_token"
    t.datetime "confirmed_at"
    t.datetime "confirmation_sent_at"
    t.string   "unconfirmed_email"
    t.string   "distributor_code",                                 null: false
    t.integer  "distributor_referror_id"
    t.string   "first_name",                                       null: false
    t.string   "middle_name"
    t.string   "last_name",                                        null: false
    t.date     "date_of_birth"
    t.string   "nickname",                limit: 40
    t.string   "citizens_id",                                      null: false
    t.string   "email"
    t.text     "address"
    t.string   "district"
    t.string   "city"
    t.string   "state"
    t.string   "postal_code"
    t.string   "telephone_number"
    t.string   "mobile_number"
    t.string   "active",                             default: "t", null: false
    t.json     "tokens"
    t.datetime "created_at",                                       null: false
    t.datetime "updated_at",                                       null: false
    t.integer  "staff_creator_id"
    t.index ["distributor_code"], name: "index_distributors_on_distributor_code", unique: true, using: :btree
    t.index ["email"], name: "index_distributors_on_email", unique: true, using: :btree
    t.index ["id", "distributor_referror_id"], name: "index_distributor_sponsor", unique: true, using: :btree
    t.index ["id", "staff_creator_id"], name: "index_distributor_staff_creator", unique: true, using: :btree
    t.index ["reset_password_token"], name: "index_distributors_on_reset_password_token", unique: true, using: :btree
  end

  create_table "freight_providers", force: :cascade do |t|
    t.string   "name"
    t.string   "telephone_number"
    t.string   "fax_number"
    t.datetime "created_at",       null: false
    t.datetime "updated_at",       null: false
  end

  create_table "fullfillment_act_as_shippingables", force: :cascade do |t|
    t.integer  "fullfillment_shipping_address_id"
    t.integer  "shippingable_id"
    t.string   "shippingable_type"
    t.datetime "created_at",                       null: false
    t.datetime "updated_at",                       null: false
    t.index ["fullfillment_shipping_address_id"], name: "index_fullfillment_shipping_address_id_on_act_as_shippingables", using: :btree
    t.index ["shippingable_id", "shippingable_type"], name: "index_shippingable_on_act_as_shippingables", using: :btree
  end

  create_table "fullfillment_shipping_addresses", force: :cascade do |t|
    t.string   "recipient_name"
    t.string   "recipient_telephone_number"
    t.text     "address"
    t.string   "district"
    t.string   "city"
    t.string   "state"
    t.string   "postal_code"
    t.datetime "created_at",                 null: false
    t.datetime "updated_at",                 null: false
    t.string   "freight_tracking_code"
    t.integer  "freight_provider_id"
    t.integer  "geo_country_id"
    t.index ["freight_provider_id"], name: "index_fullfillment_shipping_addresses_on_freight_provider_id", using: :btree
    t.index ["freight_tracking_code"], name: "index_fullfillment_shipping_addresses_on_freight_tracking_code", using: :btree
    t.index ["geo_country_id"], name: "index_fullfillment_shipping_addresses_on_geo_country_id", using: :btree
  end

  create_table "geo_countries", force: :cascade do |t|
    t.string   "iso_3166_a2_code"
    t.string   "display_text_en"
    t.datetime "created_at",       null: false
    t.datetime "updated_at",       null: false
    t.string   "iso_3166_a3_code"
    t.string   "iso_3166_n_code"
    t.string   "itu_t_tel_code"
    t.index ["display_text_en"], name: "index_geo_countries_on_display_text_en", unique: true, using: :btree
    t.index ["iso_3166_a2_code"], name: "index_geo_countries_on_iso_3166_a2_code", unique: true, using: :btree
    t.index ["iso_3166_a3_code"], name: "index_geo_countries_on_iso_3166_a3_code", unique: true, using: :btree
    t.index ["iso_3166_n_code"], name: "index_geo_countries_on_iso_3166_n_code", unique: true, using: :btree
    t.index ["itu_t_tel_code"], name: "index_geo_countries_on_itu_t_tel_code", using: :btree
  end

  create_table "inventory_act_as_countables", force: :cascade do |t|
    t.integer  "countable_id"
    t.string   "countable_type"
    t.integer  "inventory_countable_unit_id"
    t.datetime "created_at",                  null: false
    t.datetime "updated_at",                  null: false
    t.index ["countable_id", "countable_type", "inventory_countable_unit_id"], name: "index_countable_unit_type_on_act_as_countable", using: :btree
  end

  create_table "inventory_countable_units", force: :cascade do |t|
    t.string   "code"
    t.string   "display_name"
    t.datetime "created_at",   null: false
    t.datetime "updated_at",   null: false
  end

  create_table "inventory_inventory_items", force: :cascade do |t|
    t.string   "display_name",         null: false
    t.string   "supplier_sku"
    t.integer  "supplier_supplier_id"
    t.datetime "created_at",           null: false
    t.datetime "updated_at",           null: false
    t.index ["supplier_sku", "supplier_supplier_id"], name: "index_sku_by_supplier", using: :btree
    t.index ["supplier_supplier_id"], name: "index_inventory_inventory_items_on_supplier_supplier_id", using: :btree
  end

  create_table "inventory_item_lot_stock_ins", force: :cascade do |t|
    t.integer  "quantity",                                       null: false
    t.integer  "inventory_item_lot_id"
    t.decimal  "price_per_count",       precision: 19, scale: 4
    t.datetime "created_at",                                     null: false
    t.datetime "updated_at",                                     null: false
    t.index ["inventory_item_lot_id"], name: "index_inventory_item_lot_stock_ins_on_inventory_item_lot_id", using: :btree
  end

  create_table "inventory_item_lot_stock_outs", force: :cascade do |t|
    t.integer  "quantity",              null: false
    t.integer  "inventory_item_lot_id"
    t.datetime "created_at",            null: false
    t.datetime "updated_at",            null: false
    t.index ["inventory_item_lot_id"], name: "index_inventory_item_lot_stock_outs_on_inventory_item_lot_id", using: :btree
  end

  create_table "inventory_item_lots", force: :cascade do |t|
    t.string   "lot_number"
    t.date     "mfg_date"
    t.date     "exp_date"
    t.integer  "inventory_inventory_item_id"
    t.integer  "warehouse_facility_id"
    t.datetime "created_at",                  null: false
    t.datetime "updated_at",                  null: false
    t.index ["inventory_inventory_item_id"], name: "index_inventory_item_lots_on_inventory_inventory_item_id", using: :btree
    t.index ["warehouse_facility_id"], name: "index_inventory_item_lots_on_warehouse_facility_id", using: :btree
  end

  create_table "inventory_order_stock_out_histories", force: :cascade do |t|
    t.integer  "inventory_item_lot_stock_out_id"
    t.integer  "order_detail_id"
    t.datetime "created_at",                      null: false
    t.datetime "updated_at",                      null: false
    t.index ["inventory_item_lot_stock_out_id"], name: "index_stock_out_on_inventory_stock_out_histories", using: :btree
    t.index ["order_detail_id"], name: "index_order_detail_on_inventory_stock_out_histories", using: :btree
  end

  create_table "order_details", force: :cascade do |t|
    t.integer  "quantity"
    t.decimal  "price_per_count",    precision: 19, scale: 4
    t.integer  "product_product_id"
    t.integer  "order_order_id"
    t.datetime "created_at",                                  null: false
    t.datetime "updated_at",                                  null: false
    t.index ["order_order_id"], name: "index_order_details_on_order_order_id", using: :btree
    t.index ["product_product_id"], name: "index_order_details_on_product_product_id", using: :btree
  end

  create_table "order_orders", force: :cascade do |t|
    t.string   "billing_id"
    t.datetime "paid_full_date"
    t.integer  "create_by_staff_id"
    t.integer  "paid_approve_by_staff_id"
    t.integer  "shipping_approve_by_staff_id"
    t.datetime "created_at",                               null: false
    t.datetime "updated_at",                               null: false
    t.datetime "shipping_approved_at"
    t.integer  "sale_by_staff_id"
    t.integer  "status",                       default: 0
    t.integer  "canceled_by_staff_id"
    t.datetime "canceled_at"
    t.index ["billing_id"], name: "index_order_orders_on_billing_id", unique: true, using: :btree
    t.index ["canceled_by_staff_id"], name: "index_order_orders_on_canceled_by_staff_id", using: :btree
    t.index ["create_by_staff_id"], name: "index_order_orders_on_create_by_staff_id", using: :btree
    t.index ["paid_approve_by_staff_id"], name: "index_order_orders_on_paid_approve_by_staff_id", using: :btree
    t.index ["sale_by_staff_id"], name: "index_order_orders_on_sale_by_staff_id", using: :btree
    t.index ["shipping_approve_by_staff_id"], name: "index_order_orders_on_shipping_approve_by_staff_id", using: :btree
  end

  create_table "payment_details", force: :cascade do |t|
    t.integer  "status",                                                           default: 0
    t.decimal  "pay_amount",                              precision: 19, scale: 4
    t.datetime "pay_datetime",                                                                 null: false
    t.text     "note"
    t.integer  "order_order_id"
    t.integer  "approve_by_staff_id"
    t.integer  "create_by_staff_id"
    t.datetime "created_at",                                                                   null: false
    t.datetime "updated_at",                                                                   null: false
    t.integer  "accounting_company_bank_account_id",                                           null: false
    t.string   "payment_receipt_image_file_file_name"
    t.string   "payment_receipt_image_file_content_type"
    t.integer  "payment_receipt_image_file_file_size"
    t.datetime "payment_receipt_image_file_updated_at"
    t.decimal  "pay_amount_reconciled",                   precision: 14, scale: 4
    t.integer  "from_bank_id"
    t.index ["accounting_company_bank_account_id"], name: "index_payment_details_on_accounting_company_bank_account_id", using: :btree
    t.index ["from_bank_id"], name: "index_from_bank_id_on_payment_datails", using: :btree
    t.index ["order_order_id"], name: "index_payment_details_on_order_order_id", using: :btree
  end

  create_table "product_contains", force: :cascade do |t|
    t.integer  "inventory_inventory_item_id"
    t.integer  "product_product_id"
    t.integer  "quantity",                    null: false
    t.datetime "created_at",                  null: false
    t.datetime "updated_at",                  null: false
    t.index ["inventory_inventory_item_id"], name: "index_product_contains_on_inventory_inventory_item_id", using: :btree
    t.index ["product_product_id"], name: "index_product_contains_on_product_product_id", using: :btree
  end

  create_table "product_prices", force: :cascade do |t|
    t.decimal  "price_th",           precision: 19, scale: 4, null: false
    t.integer  "product_product_id"
    t.integer  "staff_id"
    t.datetime "created_at",                                  null: false
    t.datetime "updated_at",                                  null: false
    t.index ["product_product_id"], name: "index_product_prices_on_product_product_id", using: :btree
    t.index ["staff_id"], name: "index_product_prices_on_staff_id", using: :btree
  end

  create_table "product_products", force: :cascade do |t|
    t.string   "sku",                            null: false
    t.string   "name_th",                        null: false
    t.string   "name_en",                        null: false
    t.text     "description_th"
    t.text     "description_en"
    t.string   "slug",                           null: false
    t.integer  "staff_id"
    t.datetime "created_at",                     null: false
    t.datetime "updated_at",                     null: false
    t.boolean  "saleable",       default: false
    t.index ["id", "staff_id"], name: "index_product_by_id_staff_id", using: :btree
    t.index ["sku"], name: "index_product_by_sku", unique: true, using: :btree
    t.index ["slug"], name: "index_product_by_slug", unique: true, using: :btree
    t.index ["staff_id"], name: "index_product_products_on_staff_id", using: :btree
  end

  create_table "roles", force: :cascade do |t|
    t.string   "name"
    t.string   "resource_type"
    t.integer  "resource_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.index ["name", "resource_type", "resource_id"], name: "index_roles_on_name_and_resource_type_and_resource_id", using: :btree
    t.index ["name"], name: "index_roles_on_name", using: :btree
  end

  create_table "staffs", force: :cascade do |t|
    t.string   "encrypted_password",     default: "",    null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          default: 0,     null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.string   "confirmation_token"
    t.datetime "confirmed_at"
    t.datetime "confirmation_sent_at"
    t.string   "unconfirmed_email"
    t.string   "employee_code",                          null: false
    t.string   "first_name",                             null: false
    t.string   "last_name",                              null: false
    t.string   "nickname"
    t.string   "email"
    t.string   "staff_account",                          null: false
    t.json     "tokens"
    t.datetime "created_at",                             null: false
    t.datetime "updated_at",                             null: false
    t.boolean  "is_active",              default: false
    t.index ["email"], name: "index_staffs_on_email", unique: true, using: :btree
    t.index ["employee_code"], name: "index_staffs_on_employee_code", unique: true, using: :btree
    t.index ["reset_password_token"], name: "index_staffs_on_reset_password_token", unique: true, using: :btree
    t.index ["staff_account"], name: "index_staffs_on_staff_account", unique: true, using: :btree
  end

  create_table "staffs_roles", id: false, force: :cascade do |t|
    t.integer "staff_id"
    t.integer "role_id"
    t.index ["staff_id", "role_id"], name: "index_staffs_roles_on_staff_id_and_role_id", using: :btree
  end

  create_table "supplier_contact_infos", force: :cascade do |t|
    t.string   "contact_person"
    t.string   "telephone_number"
    t.string   "telephone_ext"
    t.string   "mobile_number"
    t.string   "fax_number"
    t.string   "fax_ext"
    t.integer  "supplier_supplier_id"
    t.datetime "created_at",           null: false
    t.datetime "updated_at",           null: false
    t.index ["supplier_supplier_id"], name: "index_supplier_contact_infos_on_supplier_supplier_id", using: :btree
  end

  create_table "supplier_suppliers", force: :cascade do |t|
    t.string   "company_code"
    t.string   "display_name"
    t.string   "tax_id"
    t.text     "address"
    t.string   "postal_code"
    t.datetime "created_at",   null: false
    t.datetime "updated_at",   null: false
  end

  create_table "warehouse_facilities", force: :cascade do |t|
    t.string   "code",                       null: false
    t.string   "display_name",               null: false
    t.text     "address"
    t.integer  "warehouse_facility_type_id"
    t.datetime "created_at",                 null: false
    t.datetime "updated_at",                 null: false
    t.index ["code"], name: "index_warehouse_facilities_on_code", unique: true, using: :btree
    t.index ["warehouse_facility_type_id"], name: "index_warehouse_facilities_on_warehouse_facility_type_id", using: :btree
  end

  create_table "warehouse_facility_types", force: :cascade do |t|
    t.string   "code",         null: false
    t.string   "display_name", null: false
    t.datetime "created_at",   null: false
    t.datetime "updated_at",   null: false
    t.index ["code"], name: "index_warehouse_facility_types_on_code", unique: true, using: :btree
  end

  add_foreign_key "customer_customers", "staffs"
  add_foreign_key "distributors", "staffs", column: "staff_creator_id"
  add_foreign_key "fullfillment_act_as_shippingables", "fullfillment_shipping_addresses", name: "fk_rails_act_as_shippingables_shipping_address"
  add_foreign_key "fullfillment_shipping_addresses", "freight_providers"
  add_foreign_key "inventory_act_as_countables", "inventory_countable_units"
  add_foreign_key "inventory_inventory_items", "supplier_suppliers"
  add_foreign_key "inventory_item_lot_stock_ins", "inventory_item_lots"
  add_foreign_key "inventory_item_lot_stock_outs", "inventory_item_lots"
  add_foreign_key "inventory_item_lots", "inventory_inventory_items"
  add_foreign_key "inventory_item_lots", "warehouse_facilities"
  add_foreign_key "inventory_order_stock_out_histories", "inventory_item_lot_stock_outs"
  add_foreign_key "inventory_order_stock_out_histories", "order_details"
  add_foreign_key "order_details", "order_orders"
  add_foreign_key "order_details", "product_products"
  add_foreign_key "order_orders", "staffs", column: "canceled_by_staff_id"
  add_foreign_key "order_orders", "staffs", column: "create_by_staff_id", name: "fk_rails_order_creator_staff"
  add_foreign_key "order_orders", "staffs", column: "paid_approve_by_staff_id", name: "fk_rails_order_payment_approval_staff"
  add_foreign_key "order_orders", "staffs", column: "sale_by_staff_id"
  add_foreign_key "order_orders", "staffs", column: "shipping_approve_by_staff_id", name: "fk_rails_order_shipping_approval_staff"
  add_foreign_key "payment_details", "accounting_banks", column: "from_bank_id"
  add_foreign_key "payment_details", "accounting_company_bank_accounts"
  add_foreign_key "payment_details", "order_orders"
  add_foreign_key "payment_details", "staffs", column: "approve_by_staff_id", name: "fk_rails_payment_details_approval_staff"
  add_foreign_key "payment_details", "staffs", column: "create_by_staff_id", name: "fk_rails_payment_details_creator_staff"
  add_foreign_key "product_contains", "inventory_inventory_items"
  add_foreign_key "product_contains", "product_products"
  add_foreign_key "product_prices", "product_products"
  add_foreign_key "product_prices", "staffs"
  add_foreign_key "product_products", "staffs"
  add_foreign_key "supplier_contact_infos", "supplier_suppliers"
  add_foreign_key "warehouse_facilities", "warehouse_facility_types"
end
