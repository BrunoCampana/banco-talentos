ActiveAdmin.register Cargoocupado do

  index do
    #selectable_column
    column :titulo
    column :descricao
    column :inicio
    column :termino
    actions :except => [:new]
  end

  filter :titulo_cont, label: 'Título do cargo'
  filter :descricao_cont, label: 'Descrição do cargo'

  show do |cargoocupado|
    panel 'Cargos ocupados' do
      attributes_table_for cargoocupado do
        row :titulo
        row :descricao
        row :inicio
        row :termino
        row :talento
      end
    end
  end

  #belongs_to :talento
  permit_params :titulo, :descricao, :inicio, :termino,:cargoocupado_id, :talento_id

  form do |f|
    f.inputs do
      f.input :titulo
      f.input :descricao
      f.input :inicio, as: :date_time_picker, datepicker_options: { min_date: "1960-01-01", max_date: "2050-01-01", timepicker:false}
      f.input :termino, as: :date_time_picker, datepicker_options: { min_date: "1960-01-01", max_date: "2050-01-01", timepicker:false}
    end
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
  menu priority: 5
  menu parent: "Buscas específicas", label:"Buscar por cargos ocupados"
end
