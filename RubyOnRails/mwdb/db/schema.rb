# encoding: UTF-8
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
# It's strongly recommended to check this file into your version control system.

ActiveRecord::Schema.define(:version => 20120222190946) do

  create_table "avaliacaos", :force => true do |t|
    t.integer  "avaliacao"
    t.integer  "user_id"
    t.integer  "miniatura_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "comentarios", :force => true do |t|
    t.string   "texto"
    t.boolean  "publicado"
    t.integer  "user_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "miniatura_id"
  end

  create_table "construtors", :force => true do |t|
    t.string   "nome"
    t.string   "website"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.binary   "logo",       :limit => 2147483647
  end

  create_table "escalas", :force => true do |t|
    t.string   "descricao"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "foto_miniaturas", :force => true do |t|
    t.integer  "miniatura_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.binary   "foto",         :limit => 2147483647
  end

  add_index "foto_miniaturas", ["miniatura_id"], :name => "index_foto_miniaturas_on_miniatura_id"

  create_table "foto_modelos", :force => true do |t|
    t.integer  "modelo_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.binary   "foto",       :limit => 2147483647
  end

  add_index "foto_modelos", ["modelo_id"], :name => "index_foto_modelos_on_modelo_id"

  create_table "marcas", :force => true do |t|
    t.string   "nome"
    t.integer  "tipo_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.binary   "logo",       :limit => 2147483647
  end

  add_index "marcas", ["tipo_id"], :name => "index_marcas_on_tipo_id"

  create_table "miniaturas", :force => true do |t|
    t.string   "descricao"
    t.integer  "modelo_id"
    t.integer  "construtor_id"
    t.integer  "escala_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.binary   "thumb",         :limit => 2147483647
  end

  add_index "miniaturas", ["construtor_id"], :name => "index_miniaturas_on_construtor_id"

  create_table "modelos", :force => true do |t|
    t.string   "nome"
    t.integer  "ano"
    t.string   "website"
    t.integer  "marca_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.binary   "thumb",      :limit => 2147483647
  end

  add_index "modelos", ["marca_id"], :name => "index_modelos_on_marca_id"

  create_table "tipos", :force => true do |t|
    t.string   "descricao"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.binary   "thumb",      :limit => 16777215
  end

  create_table "users", :force => true do |t|
    t.string   "username"
    t.string   "password"
    t.string   "email"
    t.boolean  "admin"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "users", ["username"], :name => "index_users_on_username", :unique => true

end
