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

ActiveRecord::Schema.define(version: 2019_11_15_212819) do

  create_table "active_admin_comments", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.string "namespace"
    t.text "body"
    t.string "resource_type"
    t.bigint "resource_id"
    t.string "author_type"
    t.bigint "author_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["author_type", "author_id"], name: "index_active_admin_comments_on_author_type_and_author_id"
    t.index ["namespace"], name: "index_active_admin_comments_on_namespace"
    t.index ["resource_type", "resource_id"], name: "index_active_admin_comments_on_resource_type_and_resource_id"
  end

  create_table "admin_users", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "tipo", default: 2
    t.integer "status", default: 0
    t.bigint "quartel_id"
    t.string "nome"
    t.string "cpf"
    t.string "teleone"
    t.index ["email"], name: "index_admin_users_on_email", unique: true
    t.index ["quartel_id"], name: "index_admin_users_on_quartel_id"
    t.index ["reset_password_token"], name: "index_admin_users_on_reset_password_token", unique: true
  end

  create_table "areaatuacaos", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.string "titulo", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "areaatuacaos_talentos", id: false, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.bigint "areaatuacao_id", null: false
    t.bigint "talento_id", null: false
    t.index ["areaatuacao_id"], name: "index_areaatuacaos_talentos_on_areaatuacao_id"
    t.index ["talento_id"], name: "index_areaatuacaos_talentos_on_talento_id"
  end

  create_table "atributoafetivos", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.string "titulo", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "atributoafetivos_talentos", id: false, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.bigint "atributoafetivo_id", null: false
    t.bigint "talento_id", null: false
    t.index ["atributoafetivo_id"], name: "index_atributoafetivos_talentos_on_atributoafetivo_id"
    t.index ["talento_id"], name: "index_atributoafetivos_talentos_on_talento_id"
  end

  create_table "cargoocupados", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.string "titulo", null: false
    t.text "descricao"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "cargoocupados_talentos", id: false, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.bigint "cargoocupado_id", null: false
    t.bigint "talento_id", null: false
    t.index ["cargoocupado_id"], name: "index_cargoocupados_talentos_on_cargoocupado_id"
    t.index ["talento_id"], name: "index_cargoocupados_talentos_on_talento_id"
  end

  create_table "certificacaos", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.string "titulo", null: false
    t.string "area"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "certificacaos_talentos", id: false, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.bigint "certificacao_id", null: false
    t.bigint "talento_id", null: false
    t.index ["certificacao_id"], name: "index_certificacaos_talentos_on_certificacao_id"
    t.index ["talento_id"], name: "index_certificacaos_talentos_on_talento_id"
  end

  create_table "cidades", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.string "nome", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "cnhs", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.string "titulo", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "cnhs_talentos", id: false, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.bigint "cnh_id", null: false
    t.bigint "talento_id", null: false
    t.index ["cnh_id"], name: "index_cnhs_talentos_on_cnh_id"
    t.index ["talento_id"], name: "index_cnhs_talentos_on_talento_id"
  end

  create_table "cursos", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.string "titulo", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "cursos_talentos", id: false, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.bigint "curso_id", null: false
    t.bigint "talento_id", null: false
    t.index ["curso_id"], name: "index_cursos_talentos_on_curso_id"
    t.index ["talento_id"], name: "index_cursos_talentos_on_talento_id"
  end

  create_table "formacaoacads", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.string "titulo", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "formacaoacads_talentos", id: false, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.bigint "formacaoacad_id", null: false
    t.bigint "talento_id", null: false
    t.index ["formacaoacad_id"], name: "index_formacaoacads_talentos_on_formacaoacad_id"
    t.index ["talento_id"], name: "index_formacaoacads_talentos_on_talento_id"
  end

  create_table "formmilitars", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.string "titulo", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "habilidades", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.string "titulo", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "habilidades_talentos", id: false, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.bigint "habilidade_id", null: false
    t.bigint "talento_id", null: false
    t.index ["habilidade_id"], name: "index_habilidades_talentos_on_habilidade_id"
    t.index ["talento_id"], name: "index_habilidades_talentos_on_talento_id"
  end

  create_table "idiomas", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.string "lingua_nivel", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "idiomas_talentos", id: false, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.bigint "idioma_id", null: false
    t.bigint "talento_id", null: false
    t.index ["idioma_id"], name: "index_idiomas_talentos_on_idioma_id"
    t.index ["talento_id"], name: "index_idiomas_talentos_on_talento_id"
  end

  create_table "quartels", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.string "nome", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "tipo", default: 0
  end

  create_table "recrutamentos", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.string "nome", null: false
    t.text "o_que_procura"
    t.integer "estado", default: 0
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.date "inicio"
    t.date "termino"
    t.bigint "quartel_id"
    t.bigint "admin_user_id"
    t.index ["admin_user_id"], name: "index_recrutamentos_on_admin_user_id"
    t.index ["quartel_id"], name: "index_recrutamentos_on_quartel_id"
  end

  create_table "recrutamentos_talentos", id: false, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.bigint "recrutamento_id", null: false
    t.bigint "talento_id", null: false
    t.index ["recrutamento_id"], name: "index_recrutamentos_talentos_on_recrutamento_id"
    t.index ["talento_id"], name: "index_recrutamentos_talentos_on_talento_id"
  end

  create_table "talentos", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
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
    t.bigint "cidade_id"
    t.bigint "formmilitar_id"
    t.bigint "quartel_id"
    t.string "foto_file_name"
    t.string "foto_content_type"
    t.bigint "foto_file_size"
    t.datetime "foto_updated_at"
    t.string "curriculo_file_name"
    t.string "curriculo_content_type"
    t.bigint "curriculo_file_size"
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
    t.boolean "carta_recomendacao", default: false
    t.string "confirm_token"
    t.string "consentimento_file_name"
    t.string "consentimento_content_type"
    t.bigint "consentimento_file_size"
    t.datetime "consentimento_updated_at"
    t.boolean "email_confirmed", default: false
    t.index ["cidade_id"], name: "index_talentos_on_cidade_id"
    t.index ["formmilitar_id"], name: "index_talentos_on_formmilitar_id"
    t.index ["quartel_id"], name: "index_talentos_on_quartel_id"
  end

  create_table "versions", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8mb4", force: :cascade do |t|
    t.string "item_type", limit: 191, null: false
    t.bigint "item_id", null: false
    t.string "event", null: false
    t.string "whodunnit"
    t.text "object", limit: 4294967295
    t.datetime "created_at"
    t.index ["item_type", "item_id"], name: "index_versions_on_item_type_and_item_id"
  end

  add_foreign_key "admin_users", "quartels"
  add_foreign_key "recrutamentos", "admin_users"
  add_foreign_key "recrutamentos", "quartels"
  add_foreign_key "talentos", "cidades"
  add_foreign_key "talentos", "formmilitars"
  add_foreign_key "talentos", "quartels"
end
