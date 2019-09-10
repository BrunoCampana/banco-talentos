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

ActiveRecord::Schema.define(version: 2019_09_10_171928) do

  create_table "active_admin_comments", force: :cascade do |t|
    t.string "namespace"
    t.text "body"
    t.string "resource_type"
    t.integer "resource_id"
    t.string "author_type"
    t.integer "author_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["author_type", "author_id"], name: "index_active_admin_comments_on_author_type_and_author_id"
    t.index ["namespace"], name: "index_active_admin_comments_on_namespace"
    t.index ["resource_type", "resource_id"], name: "index_active_admin_comments_on_resource_type_and_resource_id"
  end

  create_table "admin_users", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "tipo", default: 2
    t.integer "status", default: 0
    t.integer "quartel_id"
    t.string "nome"
    t.string "cpf"
    t.index ["email"], name: "index_admin_users_on_email", unique: true
    t.index ["quartel_id"], name: "index_admin_users_on_quartel_id"
    t.index ["reset_password_token"], name: "index_admin_users_on_reset_password_token", unique: true
  end

  create_table "areaatuacaos", force: :cascade do |t|
    t.string "titulo", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "areaatuacaos_talentos", id: false, force: :cascade do |t|
    t.integer "areaatuacao_id", null: false
    t.integer "talento_id", null: false
    t.index ["areaatuacao_id"], name: "index_areaatuacaos_talentos_on_areaatuacao_id"
    t.index ["talento_id"], name: "index_areaatuacaos_talentos_on_talento_id"
  end

  create_table "atributoafetivos", force: :cascade do |t|
    t.string "titulo", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "atributoafetivos_talentos", id: false, force: :cascade do |t|
    t.integer "atributoafetivo_id", null: false
    t.integer "talento_id", null: false
    t.index ["atributoafetivo_id"], name: "index_atributoafetivos_talentos_on_atributoafetivo_id"
    t.index ["talento_id"], name: "index_atributoafetivos_talentos_on_talento_id"
  end

  create_table "cargoocupados", force: :cascade do |t|
    t.string "titulo", null: false
    t.text "descricao"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "cargoocupados_talentos", id: false, force: :cascade do |t|
    t.integer "cargoocupado_id", null: false
    t.integer "talento_id", null: false
    t.index ["cargoocupado_id"], name: "index_cargoocupados_talentos_on_cargoocupado_id"
    t.index ["talento_id"], name: "index_cargoocupados_talentos_on_talento_id"
  end

  create_table "certificacaos", force: :cascade do |t|
    t.string "titulo", null: false
    t.string "area"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "certificacaos_talentos", id: false, force: :cascade do |t|
    t.integer "certificacao_id", null: false
    t.integer "talento_id", null: false
    t.index ["certificacao_id"], name: "index_certificacaos_talentos_on_certificacao_id"
    t.index ["talento_id"], name: "index_certificacaos_talentos_on_talento_id"
  end

  create_table "cidades", force: :cascade do |t|
    t.string "nome", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "cnhs", force: :cascade do |t|
    t.string "titulo", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "cnhs_talentos", id: false, force: :cascade do |t|
    t.integer "cnh_id", null: false
    t.integer "talento_id", null: false
    t.index ["cnh_id"], name: "index_cnhs_talentos_on_cnh_id"
    t.index ["talento_id"], name: "index_cnhs_talentos_on_talento_id"
  end

  create_table "cursos", force: :cascade do |t|
    t.string "titulo", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "cursos_talentos", id: false, force: :cascade do |t|
    t.integer "curso_id", null: false
    t.integer "talento_id", null: false
    t.index ["curso_id"], name: "index_cursos_talentos_on_curso_id"
    t.index ["talento_id"], name: "index_cursos_talentos_on_talento_id"
  end

  create_table "formacaoacads", force: :cascade do |t|
    t.string "titulo", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "formacaoacads_talentos", id: false, force: :cascade do |t|
    t.integer "formacaoacad_id", null: false
    t.integer "talento_id", null: false
    t.index ["formacaoacad_id"], name: "index_formacaoacads_talentos_on_formacaoacad_id"
    t.index ["talento_id"], name: "index_formacaoacads_talentos_on_talento_id"
  end

  create_table "formmilitars", force: :cascade do |t|
    t.string "titulo", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "habilidades", force: :cascade do |t|
    t.string "titulo", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "habilidades_talentos", id: false, force: :cascade do |t|
    t.integer "habilidade_id", null: false
    t.integer "talento_id", null: false
    t.index ["habilidade_id"], name: "index_habilidades_talentos_on_habilidade_id"
    t.index ["talento_id"], name: "index_habilidades_talentos_on_talento_id"
  end

  create_table "idiomas", force: :cascade do |t|
    t.string "lingua_nivel", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "idiomas_talentos", id: false, force: :cascade do |t|
    t.integer "idioma_id", null: false
    t.integer "talento_id", null: false
    t.index ["idioma_id"], name: "index_idiomas_talentos_on_idioma_id"
    t.index ["talento_id"], name: "index_idiomas_talentos_on_talento_id"
  end

  create_table "quartels", force: :cascade do |t|
    t.string "nome", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "tipo", default: 0
  end

  create_table "talentos", force: :cascade do |t|
    t.string "nome_completo", null: false
    t.integer "genero", default: 0
    t.date "nascimento"
    t.string "idt"
    t.integer "estado_civil", default: 0
    t.string "nome_pai"
    t.string "nome_mae"
    t.integer "pcd", default: 0
    t.string "email"
    t.string "celular"
    t.string "endereco"
    t.string "linkedin"
    t.string "facebook"
    t.string "instagram"
    t.text "cargos_pre_eb"
    t.integer "hierarquia", default: 0
    t.string "ndg"
    t.date "data_praca"
    t.date "data_desligamento"
    t.integer "disponibilidade", default: 0
    t.integer "viajar", default: 0
    t.integer "mudar", default: 0
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "cidade_id"
    t.integer "formmilitar_id"
    t.integer "quartel_id"
    t.string "foto_file_name"
    t.string "foto_content_type"
    t.integer "foto_file_size"
    t.datetime "foto_updated_at"
    t.string "curriculo_file_name"
    t.string "curriculo_content_type"
    t.integer "curriculo_file_size"
    t.datetime "curriculo_updated_at"
    t.string "bairro"
    t.string "quando_disponivel"
    t.string "nome_referencia"
    t.string "cel_referencia"
    t.string "email_referencia"
    t.boolean "aval_cmt", default: false
    t.boolean "contratacao_imediata", default: false
    t.string "tel_ctt2"
    t.string "cpf"
    t.index ["cidade_id"], name: "index_talentos_on_cidade_id"
    t.index ["formmilitar_id"], name: "index_talentos_on_formmilitar_id"
    t.index ["quartel_id"], name: "index_talentos_on_quartel_id"
  end

end
