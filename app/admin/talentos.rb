ActiveAdmin.register Talento do

  index do
    #selectable_column
    column :hierarquia
    column :nome_completo
    column :celular
    column :email
    actions
  end

  filter :nome_completo_cont, label: "------Para não usar um filtro em sua busca, apenas deixe-o em branco------- Nome Completo"
  filter :genero, as: :check_boxes, collection: Talento.generos
  filter :idade
  filter :estado_civil, as: :check_boxes, collection: Talento.estado_civils
  filter :pcd, as: :check_boxes, collection: Talento.pcds
  filter :status_atual, as: :check_boxes, collection: Talento.status_atuals
  filter :hierarquia, as: :check_boxes, collection: Talento.hierarquia
  filter :ndg_cont, label: 'Nome de guerra'
  filter :disponibilidade, as: :check_boxes, collection: Talento.disponibilidades
  filter :viajar, as: :check_boxes, collection: Talento.viajars
  filter :mudar, as: :check_boxes, collection: Talento.mudars
  filter :cidade

  show do |talento|
    panel 'Informações básicas' do
      attributes_table_for talento do
        row :foto do
          image_tag(talento.foto.url(:thumb))
        end
        row :nome_completo
        row :nascimento
        row :idade
        row :genero
        row :cidade
        row :cpf
        row :idt
        row :estado_civil
        row :nome_pai
        row :nome_mae
        row :pcd
        row :altura
        row :peso
      end
    end

    panel 'Informações de contato' do
      attributes_table_for talento do
        row :email
        row :celular
        row :endereco
        row :linkedin
        row :facebook
        row :instagram
      end
    end

    panel 'Informações de treinamento e experiência' do
      attributes_table_for talento do
        row :status_atual
        row :formacaoacads
        row :areaatuacaos
        row :habilidades
        row :cursos
        row :cargoocupados
        row :cargos_pre_eb
        row :certificacaos
      end
    end

    panel 'Informações militares' do
      attributes_table_for talento do
        row :hierarquia
        row :ndg
        row :quartel
        row :formmilitar
        row :data_praca
        row :data_desligamento
        row :tmp_sv_militar
      end
    end

    panel 'Conceito militar' do
      attributes_table_for talento do
        row :assiduidade
        row :pontualidade
        row :disciplina
        row :lideranca
        row :apresentacao
        row :dedicacao
        row :iniciativa
        row :produtividade
        row :comunicacao
        row :estab_emocional
        row :resistencia_fisica
        row :parecer_cmt
      end
    end

    panel 'Expectativas profissionais' do
      attributes_table_for talento do
        row :disponibilidade
        row :pretensao_salario
        row :area_procurada
        row :nivel_formacao_cargo
        row :viajar
        row :mudar
      end
    end
  end

  permit_params :talento_id, :nome_completo, :genero, :nascimento, :cpf, :idt, :estado_civil, :nome_pai, :nome_mae, :pcd, :altura, :peso, :email, :celular, :endereco, :linkedin, :facebook, :instagram, :status_atual, :cargos_pre_eb, :hierarquia, :ndg, :data_praca, :data_desligamento, :assiduidade, :pontualidade, :disciplina, :lideranca, :apresentacao, :dedicacao, :iniciativa, :produtividade, :comunicacao, :estab_emocional, :resistencia_fisica, :parecer_cmt, :disponibilidade, :pretensao_salario, :area_procurada, :nivel_formacao_cargo, :viajar, :mudar, :cidade_id, :formmilitar_id, :quartel_id, :foto, :foto_file_name, :foto_file_size, :foto_content_type, :curriculo_file_name, areaatuacao_ids: [], habilidade_ids: [], idioma_ids: [], cargoocupados_attributes: [:id, :titulo, :inicio, :termino, :descricao, :_destroy], certificacaos_attributes: [:id, :_destroy, :titulo, :area, :ano_obtencao], cursos_attributes: [:id, :_destroy, :titulo, :quando_ocorreu, :quem_ministrou, :carga_horaria, :modalidade], formacaoacads_attributes: [:id, :_destroy, :titulo, :instituicao, :nivel, :ano_formacao]

  form html: { multipart: true } do |f|
    f.inputs "Informações Pessoais:" do
      f.input :foto, :required => false, :as => :file
      f.input :nome_completo
      f.input :genero
      f.input :nascimento, as: :date_time_picker, datepicker_options: { min_date: "1960-01-01", max_date: "2019-01-01", timepicker:false}
      f.input :cidade
      f.input :cpf
      f.input :idt
      f.input :estado_civil
      f.input :nome_pai
      f.input :nome_mae
      f.input :pcd
      f.input :altura
      f.input :peso
    end
    f.inputs "Informações de contato:" do
      f.input :email
      f.input :celular
      f.input :endereco
      f.input :linkedin
      f.input :facebook
      f.input :instagram
    end
    f.inputs "Informações de treinamento e experiência:" do
      f.input :status_atual
      f.input :cargos_pre_eb
      f.input :habilidades, :as => :select
      f.inputs do
        f.has_many :formacaoacads, heading: 'Formação Acadêmica', allow_destroy: true, new_record: true do |a|
          a.input :titulo
          a.input :instituicao
          a.input :nivel
          a.input :ano_formacao
        end
      end
      f.inputs do
        f.has_many :cursos, heading: 'Cursos que possui', allow_destroy: true, new_record: true do |a|
          a.input :titulo
          a.input :carga_horaria
          a.input :modalidade
          a.input :quem_ministrou
          a.input :quando_ocorreu, label: "Quando curso foi ministrado"
        end
      end
      f.input :areaatuacaos, :as => :select
      f.inputs do
        f.has_many :cargoocupados, heading: 'Cargos ocupados no período de sv militar', allow_destroy: true, new_record: true do |a|
          a.input :titulo
          a.input :descricao
          a.input :inicio
          a.input :termino
        end
      end
      f.inputs do
        f.has_many :certificacaos, heading: 'Certificações que possui', allow_destroy: true, new_record: true do |a|
          a.input :titulo
          a.input :area
          a.input :ano_obtencao
        end
      end
      f.input :idiomas, :as => :select
    end
    f.inputs "Informações militares:" do
      f.input :hierarquia
      f.input :ndg
      f.input :quartel
      f.input :formmilitar
      f.input :data_praca, as: :date_time_picker, datepicker_options: { min_date: "2005-01-1", max_date: "2030-01-01", timepicker:false}
      f.input :data_desligamento, as: :date_time_picker, datepicker_options: { min_date: "2015-01-1", max_date: "2040-01-01", timepicker:false}
    end
    f.inputs "Conceito militar:" do
      f.input :assiduidade
      f.input :pontualidade
      f.input :disciplina
      f.input :lideranca
      f.input :apresentacao
      f.input :dedicacao
      f.input :iniciativa
      f.input :produtividade
      f.input :comunicacao
      f.input :estab_emocional
      f.input :resistencia_fisica
      f.input :parecer_cmt
    end
    f.inputs "Expectativas profissionais:" do
      f.input :disponibilidade
      f.input :pretensao_salario
      f.input :area_procurada
      f.input :nivel_formacao_cargo
      f.input :viajar
      f.input :mudar
      f.input :curriculo_file_name
    end
    f.actions
  end

  # See permitted parameters documentation:
  # https://github.com/activeadmin/activeadmin/blob/master/docs/2-resource-customization.md#setting-up-strong-parameters
  #
  # permit_params :list, :of, :attributes, :on, :model
  #
  # or
  #
  # permit_params do
  #   permitted = [:permitted, :attributes]
  #   permitted << :other if params[:action] == 'create' && current_user.admin?
  #   permitted
  # end
  menu priority: 2, label: "Talentos"
end
