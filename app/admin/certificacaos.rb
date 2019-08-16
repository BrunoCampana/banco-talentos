ActiveAdmin.register Certificacao do
  #belongs_to :talento
  config.remove_action_item(:new)
  index do
    #selectable_column
    column :titulo
    column :area
    column :ano_obtencao
    actions :except => [:new]
  end

  filter :titulo_cont, label: 'Título'
  filter :area_cont, label: 'Área de conhecimento'

  show do |certificacao|
    panel 'Certificação' do
      attributes_table_for certificacao do
        row :titulo
        row :area
        row :ano_obtencao
        row :talento
      end
    end
  end
  permit_params :certificacao_id, :titulo, :area, :ano_obtencao, :talento_id

  form do |f|
    f.input :titulo
    f.input :area
    f.input :ano_obtencao, as: :date_time_picker, datepicker_options: { min_date: "1960-01-01", max_date: "2050-01-01", timepicker:false}
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
  menu priority: 8
  menu parent: "Buscas específicas", label:"Buscar por Certificações que possui"
end
