ActiveAdmin.register Formacaoacad do

  #belongs_to :talento

  index do
    #selectable_column
    column :titulo
    column :instituicao
    column :nivel
    column :ano_formacao
    actions :except => [:new]
  end

  filter :titulo_cont, label: 'Título'
  filter :instituicao_cont, label: 'Instituição de ensino'
  filter :nivel, as: :check_boxes, collection: Formacaoacad.nivels

  show do |formacaoacad|
    panel 'Formação Acadêmica' do
      attributes_table_for formacaoacad do
        row :titulo
        row :instituicao
        row :nivel
        row :ano_formacao
        row :talento
      end
    end
  end
  permit_params :formacaoacad_id, :titulo, :instituicao, :nivel, :ano_formacao, :talento_id

  form do |f|
    f.input :titulo
    f.input :instituicao
    f.input :nivel
    f.input :ano_formacao, as: :date_time_picker, datepicker_options: { min_date: "1960-01-01", max_date: "2050-01-01", timepicker:false}
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
  config.comments = false
  menu priority: 7
  menu parent: "Buscas específicas", label:"Buscar por formação acadêmica"
end
