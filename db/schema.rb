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

ActiveRecord::Schema.define(version: 20181123145207) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "bancos", force: :cascade do |t|
    t.string "nome_banco"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "cargos", force: :cascade do |t|
    t.string "cargo"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "cargos_funcionarios", force: :cascade do |t|
    t.bigint "cargo_id"
    t.bigint "funcionario_id"
    t.index ["cargo_id"], name: "index_cargos_funcionarios_on_cargo_id"
    t.index ["funcionario_id"], name: "index_cargos_funcionarios_on_funcionario_id"
  end

  create_table "clientes", force: :cascade do |t|
    t.string "cpf"
    t.string "nome"
    t.date "data_nasc"
    t.string "cep"
    t.string "logradouro"
    t.float "debito"
    t.integer "num_logradouro"
    t.string "bairro"
    t.string "cidade"
    t.string "uf"
    t.string "pais"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "dados_bancarios", force: :cascade do |t|
    t.string "conta"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "funcionarios", force: :cascade do |t|
    t.string "cpf"
    t.string "nome"
    t.float "salario"
    t.date "data_nasc"
    t.string "cep"
    t.string "logradouro"
    t.integer "num_logradouro"
    t.string "bairro"
    t.string "cidade"
    t.string "uf"
    t.string "pais"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "funcionarios_setores", force: :cascade do |t|
    t.bigint "setor_id"
    t.bigint "funcionario_id"
    t.index ["funcionario_id"], name: "index_funcionarios_setores_on_funcionario_id"
    t.index ["setor_id"], name: "index_funcionarios_setores_on_setor_id"
  end

  create_table "invoices", force: :cascade do |t|
    t.float "valor"
    t.string "tipo_conta"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "items", force: :cascade do |t|
    t.integer "quantidade"
    t.float "preco_final"
    t.bigint "order_id"
    t.bigint "product_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["order_id"], name: "index_items_on_order_id"
    t.index ["product_id"], name: "index_items_on_product_id"
  end

  create_table "orders", force: :cascade do |t|
    t.boolean "status"
    t.bigint "cliente_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["cliente_id"], name: "index_orders_on_cliente_id"
  end

  create_table "products", force: :cascade do |t|
    t.string "nome"
    t.string "descricao"
    t.string "imagem"
    t.integer "quantidade"
    t.float "preco"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "slug"
  end

  create_table "providers", force: :cascade do |t|
    t.string "nome"
    t.string "cnpj"
    t.string "cpf"
    t.string "cep"
    t.string "logradouro"
    t.string "num_logradouro"
    t.string "bairro"
    t.string "cidade"
    t.string "uf"
    t.string "pais"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "email"
  end

  create_table "setores", force: :cascade do |t|
    t.string "setor"
    t.boolean "manipular_funcionario"
    t.boolean "manipular_cliente"
    t.boolean "manipular_produto"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "telefones", force: :cascade do |t|
    t.string "telefone"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "funcionario_id"
    t.index ["funcionario_id"], name: "index_telefones_on_funcionario_id"
  end

  create_table "users", force: :cascade do |t|
    t.bigint "funcionario_id"
    t.bigint "cliente_id"
    t.boolean "admin"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.index ["cliente_id"], name: "index_users_on_cliente_id"
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["funcionario_id"], name: "index_users_on_funcionario_id"
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  add_foreign_key "items", "orders"
  add_foreign_key "items", "products"
  add_foreign_key "orders", "clientes"
  add_foreign_key "telefones", "funcionarios"
  add_foreign_key "users", "clientes"
  add_foreign_key "users", "funcionarios"
end
