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

ActiveRecord::Schema[7.2].define(version: 2024_09_03_015805) do
  create_table "colaboradores", charset: "latin1", force: :cascade do |t|
    t.bigint "sucursal_id", null: false
    t.string "nombre"
    t.string "cui"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["sucursal_id"], name: "index_colaboradores_on_sucursal_id"
  end

  create_table "empresas", charset: "latin1", force: :cascade do |t|
    t.string "nombre"
    t.string "pais"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "sucursales", charset: "latin1", force: :cascade do |t|
    t.bigint "empresa_id", null: false
    t.string "nombre"
    t.string "direccion"
    t.string "telefono"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["empresa_id"], name: "index_sucursales_on_empresa_id"
  end

  add_foreign_key "colaboradores", "sucursales", column: "sucursal_id"
  add_foreign_key "sucursales", "empresas"
end
