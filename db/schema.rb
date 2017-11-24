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

ActiveRecord::Schema.define(version: 20171124162250) do

  create_table "categorias", force: :cascade do |t|
    t.string "nombre"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "comentarios", force: :cascade do |t|
    t.integer "user_id"
    t.integer "negocio_id"
    t.string "comentario"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "favoritos", force: :cascade do |t|
    t.integer "user_id"
    t.integer "negocio_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "horarios", force: :cascade do |t|
    t.integer "negocio_id"
    t.time "hora_inicio"
    t.time "hora_fin"
    t.integer "dia"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "llamadas", force: :cascade do |t|
    t.integer "user_id"
    t.integer "negocio_id"
    t.datetime "fecha"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "membresia", force: :cascade do |t|
    t.string "nombre"
    t.integer "metros_alcance"
    t.string "descripcion"
    t.float "precio"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "negocio_categoria", force: :cascade do |t|
    t.integer "categoria_id"
    t.integer "negocio_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "negocio_palabras", force: :cascade do |t|
    t.integer "negocio_id"
    t.integer "palabra_clave_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "negocios", force: :cascade do |t|
    t.string "nombre_empresa"
    t.float "latitud"
    t.float "longitud"
    t.integer "verificado"
    t.integer "precio_promedio"
    t.float "rating_precio"
    t.float "rating_calidad"
    t.text "imagen"
    t.integer "cantidad_rating"
    t.integer "cantidad_precio"
    t.datetime "ultima_conexion"
    t.datetime "fecha_registro"
    t.string "descripcion"
    t.string "telefono"
    t.integer "user_id"
    t.integer "veces_visto"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "membresia_id"
  end

  create_table "palabra_claves", force: :cascade do |t|
    t.string "palabra"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "pendientes", force: :cascade do |t|
    t.integer "user_id"
    t.integer "negocio_id"
    t.boolean "pendiente"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "promocions", force: :cascade do |t|
    t.string "nombre"
    t.string "descripcion"
    t.integer "aprobada"
    t.text "poster"
    t.datetime "fecha_registro"
    t.integer "negocio_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "users", force: :cascade do |t|
    t.string "email"
    t.string "encrypted_password"
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer "sign_in_count"
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string "current_sign_in_ip"
    t.string "last_sign_in_ip"
    t.string "confirmation_token"
    t.datetime "confirmed_at"
    t.datetime "confirmation_sent_at"
    t.string "apellidos"
    t.string "celular"
    t.boolean "activo"
    t.string "tipo"
    t.text "foto"
    t.string "name"
    t.string "provider"
    t.string "uid"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "vendedors", force: :cascade do |t|
    t.string "codigo"
    t.integer "user_id"
    t.date "fecha"
    t.datetime "fecha_venta"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "venta", force: :cascade do |t|
    t.integer "user_id"
    t.integer "vendedor_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

end
