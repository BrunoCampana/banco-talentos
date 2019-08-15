ActiveAdmin.register Habilidade do

  index do
    #selectable_column
    column :titulo
    if current_admin_user.admin?
      actions
    else
      actions :except => [:new]
    end
  end

  filter :titulo_cont, label: 'Habilidade'

  show do |habilidade|
    panel 'Habilidade' do
      attributes_table_for habilidade do
        row :titulo
        row :talentos
      end
    end
  end
  permit_params :habilidade_id, :titulo, talento_ids: []

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
  menu priority: 6
  menu parent: "Buscas específicas", label:"Buscar por habilidades que possui"
  config.sort_order = "titulo"
end
