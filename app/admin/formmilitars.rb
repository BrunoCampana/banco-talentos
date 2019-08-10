ActiveAdmin.register Formmilitar do

  index do
    #selectable_column
    column :titulo
    actions
  end

  filter :titulo_cont, label: 'Título'

  show do |formmilitar|
    panel 'Formação Militar' do
      attributes_table_for formmilitar do
        row :titulo
        row :talentos
      end
    end
  end
  permit_params :formmilitar_id, :titulo, :talentos

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
  menu parent: "Buscar por capacitação", label:"Buscar por formação militar"
  config.sort_order = "titulo"
end
