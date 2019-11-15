ActiveAdmin.register Talento do

  config.sort_order = 'carta_recomendacao_desc'
  controller do
    def action_methods
      if current_admin_user.recrutador?
        super - ['destroy', 'new', 'create']
      else
        super
      end
    end
    def create
      super
      if ((@talento.consentimento_file_name.presence == '') || (@talento.consentimento_file_name.presence == nil)) && (@talento.confirm_token != nil)
        TalentoMailer.with(talento: @talento).confirmacao_politica_privacidade.deliver_now
      else
        @talento.email_activate
        #@talento.email_confirmed = true
        #@talento.confirm_token = nil
      end
    end
  end

  member_action :history do
    @talento = Talento.find(params[:id])
    @versions = PaperTrail::Version.where(item_type: 'Talento', item_id: @talento.id)
    render "layouts/history"
  end

  scope :perfis, :default => true do |talentos|
    if current_admin_user.admin?
      talentos.all
    elsif current_admin_user.recrutador?
      talentos.where("email_confirmed = ? AND aval_cmt = ?", true, true)
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
    bool_column :carta_recomendacao
    if not current_admin_user.recrutador?
      bool_column :email_confirmed
    end
    actions
  end

  filter :ndg_cont, label: "Para não usar um filtro em sua busca, apenas deixe-o em branco ou desligue-o nos checkboxes ----------------------------------- Nome de guerra"
  filter :cidade, as: :searchable_select, multiple: true
  filter :carta_recomendacao
  filter :contratacao_imediata
  filter :genero, as: :searchable_select, multiple:true, collection: Talento.generos #, as: :check_boxes, collection: Talento.generos
  filter :pcd, as: :searchable_select, multiple:true, collection: Talento.pcds #, as: :check_boxes
  #filter :disponibilidade, as: :searchable_select, collection: Talento.disponibilidades #, as: :check_boxes
  filter :viajar, as: :searchable_select, multiple:true, collection: Talento.viajars #, as: :check_boxes
  filter :mudar, as: :searchable_select, multiple:true, collection: Talento.mudars #, as: :check_boxes
  filter :cnhs, as: :searchable_select, multiple: true
  filter :habilidades, as: :searchable_select, multiple: true
  filter :formacaoacads, as: :searchable_select, multiple: true
  filter :cursos, as: :searchable_select, multiple: true
  filter :certificacaos, as: :searchable_select, multiple: true
  filter :atributoafetivos, as: :searchable_select, multiple: true
  filter :hierarquia, as: :searchable_select, multiple: true, collection: Talento.hierarquia
  #if proc{current_admin_user.admin?}
  #  filter :quartel, as: :searchable_select, multiple: true, collection: -> {Quartel.where{|quart| quart.tipo == 0}}
  #end
  filter :bairro_cont, label: 'Bairro'
  filter :idiomas, as: :searchable_select, multiple: true
  #if proc{current_admin_user.admin?}
  #  filter :email_confirmed
  #end

  show do |talento|
    panel 'Informações básicas' do
      attributes_table_for talento do
        row :carta_recomendacao
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
        row :tel_ctt2
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
        if not current_admin_user.recrutador?
          :email_confirmed
        end
        attachment_row("Arquivo de concorde do militar com compartilhamento de seus dados na plataforma", :consentimento, label: 'Download do arquivo de política de privacidade', truncate: false)
      end
    end
  end

  permit_params :talento_id, :nome_completo, :genero, :nascimento, :cpf, :idt, :estado_civil, :nome_pai, :nome_mae, :pcd, :email, :celular, :utf8, :authenticity_token, :endereco, :linkedin, :facebook, :instagram, :cargos_pre_eb, :tel_ctt2, :hierarquia, :ndg, :data_praca, :data_desligamento, :disponibilidade, :viajar, :mudar, :bairro, :contratacao_imediata, :quando_disponivel, :aval_cmt, :carta_recomendacao, :nome_referencia, :cel_referencia, :email_referencia, :email_confirmed, :confirm_token, :consentimento, :cidade_id, :formmilitar_id, :quartel_id, :foto, :foto_file_name, :foto_file_size, :foto_content_type, :curriculo_file_name, cnh_ids: [], areaatuacao_ids: [], habilidade_ids: [], atributoafetivo_ids: [], idioma_ids: [], cargoocupado_ids: [], certificacao_ids: [], curso_id: [], formacaoacad_ids: []

  form html: { multipart: true } do |f|
    f.inputs "Informações Pessoais" do
      f.input :consentimento, :required => true, as: :file, :hint => "Faça upload do arquivo (foto ou cópia digital do documento de Política de Privacidade em que o militar concorda com a inserção de seus dados pessoais na Plataforma)"
      f.input :foto, :required => false, :as => :file, :hint => image_tag(f.object.foto.url(:thumb))
      f.input :nome_completo, :hint => "Por extenso, sem abreviações, apenas letras e todas maiúsculas. Ex: ALAN MATHISON TURING"
      f.input :genero #, as: :select, collection: Talento.genero.keys
      f.input :nascimento, as: :date_time_picker, picker_options: { min_date: Date.current - 50.years, max_date: Date.current - 17.years, timepicker:false}
      f.input :cpf, :hint => "Insira somente os 11 dígitos, todos juntos, sem traços e pontos separadores. Ex: 11122233344"
      f.input :idt, :hint => "Insira com traço separador e indicando órgão expedidor. Ex: 010022343-88 / EB"
      f.input :estado_civil
      f.input :nome_pai, :hint => "Por extenso, sem abreviações, apenas letras e todas maiúsculas. Ex: ALBERT ENSTEIN"
      f.input :nome_mae, :hint => "Por extenso, sem abreviações, apenas letras e todas maiúsculas. Ex: JAMES CLERK MAXWELL"
      f.input :pcd
    end
    f.inputs "Informações de contato" do
      f.input :email, :hint => "Ex: meuemail@algumprovedor.com"
      f.input :celular, :hint => "Apenas números, todos juntos. Ex:9299911133"
      f.input :tel_ctt2, :hint => "Telefone alternativo para contato (de casa, de parente ou da própria OM, caso na ativa)"
      f.input :cidade, input_html: { class: "select2" }
      f.input :bairro, :hint => "Ex: Cidade Nova"
      f.input :endereco, :hint => "Não precisa pôr cidade e bairro, apenas logadouro, número e complementos. Ex: Av Coronel Teixeira, 4715"
      f.input :linkedin, :hint => "Caso use esta rede social, colocar o endereço de seu perfil. Ex: linkedin.com/in/engbrunocampana/"
      f.input :facebook, :hint => "Caso use esta rede social, colocar o endereço de seu perfil. Ex: facebook.com/brunorcampana"
      f.input :instagram, :hint => "Caso use esta rede social, colocar o endereço de seu perfil. Ex: @brunoramoscampana"
    end
    f.inputs "Treinamento formal" do
      f.input :formacaoacads, as: :searchable_select, :hint => "Selecione todas as formações acadêmicas que o militar possuir. Caso não seja encontrada a formação acadêmica do militar, cadastre uma nova"
      f.input :cursos, :hint => "Selecione todas os cursos que o militar possuir. Caso não seja encontrada o curso do militar, cadastre uma nova"
      f.input :certificacaos, :hint => "Certificações são exames que comprovam conhecimento em determinada área. Exemplos: Cambridge English, Oxford English, Furukawa, etc. Selecione todas as certificações que o militar possuir. Caso não seja encontrada a certificação do militar, cadastre uma nova"
      f.input :cnhs
    end
    f.inputs "Experiência profissional prática" do
      f.input :areaatuacaos,  :hint => "Marque somente áreas de atuação em que possui experiência prática de período maior que 1 ano"
      f.input :habilidades, :hint => "Habilidades que o militar exerceu na prática por período maior que 1 ano"
      f.input :cargos_pre_eb, :hint => "Espaço para o militar descrever as organizações onde trabalhou, de quando a quando trabalhou nas mesmas e quais cargos exerceu nestas. Não exceder o espaço da caixa de texto."
      f.input :cargoocupados, :hint => "Selecione todos os cargos ocupados no EB por período de pelo menos 6 meses"
      f.input :idiomas, :hint => "Marque quantas habilidades forem reais"
    end

    f.inputs "Carreira militar" do
      f.input :hierarquia
      f.input :ndg, :hint => "Letras maiúsculas. Ex:NEWTON"
      if f.object.new_record?
        input :quartel, collection: Quartel.where(:id => current_admin_user.quartel_id)
      end
      f.input :formmilitar#, input_html: { class: "select2" }
      f.input :data_praca, as: :date_time_picker, picker_options: { min_date: Date.current - 10.years, max_date: Date.current, timepicker:false}
      f.input :data_desligamento, as: :date_time_picker, picker_options: { min_date: Date.current - 2.years, max_date: Date.current, timepicker:false}, :hint => "Deixe em branco se ainda está na ativa"
    end
    f.inputs "Opinião do chefe direto" do
      f.input :carta_recomendacao, label: "Marque apenas se o sr deseja indicar o militar (como a antiga carta de recomendação)"
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
      if f.object.persisted? and current_admin_user.admin?
        f.input :email_confirmed, as: :boolean
      end
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

=begin
action_item :history, only: :index do
  link_to "audit", "/app/admin/talentos/#{self.id}/history"
end
=end
