ActiveAdmin.register Quartel do

  index do
    #selectable_column
    column :nome
    actions
  end

  filter :nome_cont, label: 'Organização Militar'

  show do |quartel|
    panel 'Organização Militar' do
      attributes_table_for quartel do
        row :nome
        row :talentos
      end
    end
  end
  permit_params :quartel_id, :nome, :talentos

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
  menu priority: 10
  menu parent: "Buscar por localidade", label:"Buscar por organizações militares"
  config.sort_order = "nome"
end
