ActiveAdmin.register Talento do

  controller do
    def action_methods
      if current_admin_user.recrutador?
        super - ['destroy', 'new', 'create']
      else
        super
      end
    end
  end

  scope :perfis, :default => true do |talentos|
    if current_admin_user.admin?
      talentos.all
    elsif current_admin_user.recrutador?
      talentos.where(:aval_cmt => true)
    else
      talentos.where(:quartel_id => current_admin_user.quartel_id)
    end
  end

  index do
    #selectable_column
    column :hierarquia
    column :ndg
    toggle_bool_column :contratacao_imediata, success_message: 'Perfil atualizado com sucesso!'
    column :cidade
    bool_column :analisado_pelo_cmt
    if current_admin_user.cmt?
      toggle_bool_column :aval_cmt, success_message: 'Perfil atualizado com sucesso!'
    end
    actions
  end

  filter :ndg_cont, label: "Para não usar um filtro em sua busca, apenas deixe-o em branco ou desligue-o nos checkboxes Nome de guerra"
  filter :cidade, as: :searchable_select, multiple: true
  filter :contratacao_imediata
  filter :genero, as: :searchable_select#, as: :check_boxes, collection: Talento.generos
  filter :pcd, as: :searchable_select#, as: :check_boxes, collection: Talento.pcds
  filter :disponibilidade, as: :searchable_select#, as: :check_boxes, collection: Talento.disponibilidades
  filter :viajar, as: :searchable_select#, as: :check_boxes, collection: Talento.viajars
  filter :mudar, as: :searchable_select#, as: :check_boxes, collection: Talento.mudars
  filter :cnhs, as: :searchable_select, multiple: true
  filter :habilidades, as: :searchable_select, multiple: true
  filter :formacaoacads, as: :searchable_select, multiple: true
  filter :cursos, as: :searchable_select, multiple: true
  filter :certificacaos, as: :searchable_select, multiple: true
  filter :atributoafetivos, as: :searchable_select, multiple: true
  filter :hierarquia, as: :searchable_select, multiple: true
  filter :bairro_cont, label: 'Bairro'
  filter :idiomas, as: :searchable_select, multiple: true
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
        row :cpf
        row :idt
        row :estado_civil
        row :nome_pai
        row :nome_mae
        row :pcd
      end
    end

    panel 'Informações de contato' do
      attributes_table_for talento do
        row :email
        row :celular
        row :cidade
        row :bairro
        row :endereco
        row :linkedin
        row :facebook
        row :instagram
      end
    end

    panel 'Treinamento formal' do
      attributes_table_for talento do
        row :formacaoacads
        row :cursos
        row :certificacaos
        row :cnhs
      end
    end

    panel 'Experiência profissional prática' do
      attributes_table_for talento do
        row :areaatuacaos
        row :habilidades, :hint => "Habilidades que o militar exerceu na prática por período maior que 1 ano"
        row :cargos_pre_eb
        row :cargoocupados
        row :idiomas
      end
    end

    panel 'Carreira militar' do
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

    panel 'Opinião do chefe direto' do
      attributes_table_for talento do
        row :atributoafetivos
        row :nome_referencia
        row :cel_referencia
        row :email_referencia
        bool_row :analisado_pelo_cmt
      end
    end

    panel 'Expectativas profissionais' do
      attributes_table_for talento do
        row :contratacao_imediata
        row :quando_disponivel
        row :disponibilidade
        row :viajar
        row :mudar
      end
    end
  end

  permit_params :talento_id, :nome_completo, :genero, :nascimento, :cpf, :idt, :estado_civil, :nome_pai, :nome_mae, :pcd, :email, :celular, :endereco, :linkedin, :facebook, :instagram, :cargos_pre_eb, :hierarquia, :ndg, :data_praca, :data_desligamento, :disponibilidade, :viajar, :mudar, :bairro, :contratacao_imediata, :quando_disponivel, :aval_cmt, :nome_referencia, :cel_referencia, :email_referencia, :cidade_id, :formmilitar_id, :quartel_id, :foto, :foto_file_name, :foto_file_size, :foto_content_type, :curriculo_file_name,cnh_ids: [], areaatuacao_ids: [], habilidade_ids: [], atributoafetivo_ids: [], idioma_ids: [], cargoocupados_attributes: [:id, :titulo, :inicio, :termino, :descricao, :_destroy], certificacaos_attributes: [:id, :_destroy, :titulo, :area, :ano_obtencao], cursos_attributes: [:id, :_destroy, :titulo, :quando_ocorreu, :quem_ministrou, :carga_horaria, :modalidade], formacaoacads_attributes: [:id, :_destroy, :titulo, :instituicao, :nivel, :ano_formacao]

  form html: { multipart: true } do |f|
    f.inputs "Informações Pessoais" do
      f.input :foto, :required => false, :as => :file, :hint => image_tag(f.object.foto.url(:thumb))
      f.input :nome_completo, :hint => "Por extenso, sem abreviações, apenas letras e todas maiúsculas. Ex: ALAN MATHISON TURING"
      f.input :genero
      f.input :nascimento, as: :date_time_picker, picker_options: { min_date: Date.current - 50.years, max_date: Date.current - 17.years, timepicker:false}
      f.input :cpf, :hint => "Insira somente números, todos juntos, sem traços e pontos separadores. Ex: 11122233344"
      f.input :idt, :hint => "Insira com traço separador e indicando órgão expedidor. Ex: 010022343-88 / EB"
      f.input :estado_civil
      f.input :nome_pai, :hint => "Por extenso, sem abreviações, apenas letras e todas maiúsculas. Ex: ALBERT ENSTEIN"
      f.input :nome_mae, :hint => "Por extenso, sem abreviações, apenas letras e todas maiúsculas. Ex: JAMES CLERK MAXWELL"
      f.input :pcd
    end
    f.inputs "Informações de contato" do
      f.input :email, :hint => "Ex: meuemail@algumprovedor.com"
      f.input :celular, :hint => "Apenas números, todos juntos. Ex:9299911133"
      f.input :cidade, input_html: { class: "select2" }
      f.input :bairro, :hint => "Ex: Cidade Nova"
      f.input :endereco, :hint => "Não precisa pôr cidade e bairro, apenas logadouro, número e complementos. Ex: Av Coronel Teixeira, 4715"
      f.input :linkedin, :hint => "Caso use esta rede social, colocar o endereço de seu perfil. Ex: linkedin.com/in/engbrunocampana/"
      f.input :facebook, :hint => "Caso use esta rede social, colocar o endereço de seu perfil. Ex: facebook.com/brunorcampana"
      f.input :instagram, :hint => "Caso use esta rede social, colocar o endereço de seu perfil. Ex: @brunoramoscampana"
    end
    f.inputs "Treinamento formal" do
      f.inputs do
        f.has_many :formacaoacads, heading: 'Formação Acadêmica', allow_destroy: true, new_record: true do |a|
          a.input :titulo, :hint => "Exemplos: Bacharel em Direito; Ensino Médio Técnico em Eletrônica; Ensino Médio Comum; etc"
          a.input :instituicao, :hint => "Se for faculdade, inserir apenas a sigla em maiúsculo: UFAM, UEA, UNIP, etc"
          a.input :nivel
          a.input :ano_formacao, as: :date_time_picker, picker_options: { min_date: Date.current - 30.years, max_date: Date.current, timepicker:false}, :hint => "Não se preocupe caso não lembrar do dia e mês de formação"
        end
        f.inputs do
          f.has_many :cursos, heading: 'Cursos que possui', allow_destroy: true, new_record: true do |a|
            a.input :titulo, :hint => "Exemplos: Manutenção de Ar Condicionados"
            a.input :carga_horaria
            a.input :modalidade
            a.input :quem_ministrou, :hint => "Indique o nome da instituição que ministrou. Ex: SENAI"
            a.input :quando_ocorreu, as: :date_time_picker, picker_options: { min_date: Date.current - 30.years, max_date: Date.current, timepicker:false}, label: "Quando curso foi ministrado"
          end
        end
        f.inputs do
          f.has_many :certificacaos, heading: 'Certificações que possui', allow_destroy: true, new_record: true do |a|
            a.input :titulo, :hint => "Provas teóricas realizadas que comprovam conhecimento em determinada área (mais comuns na área de TI). Exemplo: Cambridge Certificate of English, Furukawa Master, PMP, etc"
            a.input :area
            a.input :ano_obtencao, as: :date_time_picker, picker_options: { min_date: Date.current - 30.years, max_date: Date.current, timepicker:false}
          end
        end
        f.input :cnhs
      end
    end
    f.inputs "Experiência profissional prática" do
      f.input :areaatuacaos, :hint => "Marque somente áreas de atuação em que possui experiência prática de período maior que 1 ano"
      f.input :habilidades, :hint => "Habilidades que o militar exerceu na prática por período maior que 1 ano"
      f.input :cargos_pre_eb, :hint => "Espaço para o militar descrever as organizações onde trabalhou, de quando a quando trabalhou nas mesmas e quais cargos exerceu nestas. Não exceder o espaço da caixa de texto."
      f.inputs do
        f.has_many :cargoocupados, heading: 'Cargos ocupados no período de sv militar', allow_destroy: true, new_record: true do |a|
          a.input :titulo, :hint => "Ex: Adjunto à 3ª Seção"
          a.input :descricao, :hint => "Auxiliar o S3 no planejamento das operações do quartel, realizando as atividades de elaboração de documentos de texto, planilhas e apresentações de slide"
          a.input :inicio
          a.input :termino
        end
      end
      f.input :idiomas, :hint => "Marque quantas habilidades forem reais"
    end

    f.inputs "Carreira militar" do
      f.input :hierarquia
      f.input :ndg
      f.input :quartel#, input_html: { class: "select2" }
      f.input :formmilitar#, input_html: { class: "select2" }
      f.input :data_praca, as: :date_time_picker, picker_options: { min_date: Date.current - 10.years, max_date: Date.current, timepicker:false}
      f.input :data_desligamento, as: :date_time_picker, picker_options: { min_date: Date.current - 2.years, max_date: Date.current, timepicker:false}, :hint => "Deixe em branco se ainda está na ativa"
    end
    f.inputs "Opinião do chefe direto" do
      f.input :atributoafetivos, label: "Marque apenas as 3 qualidades que o sr julga mais marcantes nesse militar", as: :check_boxes, :hint => "O chefe direto deverá marcar APENAS as 3 qualidades que julga mais marcantes"
      f.input :nome_referencia
      f.input :cel_referencia, :hint => "Insira apenas números. Ex: 92998111333"
      f.input :email_referencia, :hint => "Ex: meuemail@dominio.com.br"
      if current_admin_user.cmt?
        f.input :aval_cmt, as: :boolean
      end
    end
    f.inputs "Expectativas profissionais:" do
      f.input :contratacao_imediata, as: :boolean
      f.input :quando_disponivel
      f.input :disponibilidade
      f.input :viajar
      f.input :mudar
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
  menu priority: 2, label: "Recrutar Talentos"
end
#@talentos = Talento.where("ndg = 'Valentim'")
#if current_admin_user.admin?
#  @talentos = Talento.all
#elsif current_admin_user.recrutador?
#  @talentos = Talento.where(aval_cmt: true)
#else
#  @talentos = Talento.where(quartel_id==current_admin_user.quartel_id)
#@talento.quartel = current_admin_user.quartel

#controller do
#    def find_resource
#      scoped_collection.where(ndg: 'Valentim').first!
#    end
#end
