ActiveAdmin.register Quartel do

  controller do
    def action_methods
      if current_admin_user.recrutador?
        super - ['destroy', 'new', 'create', 'show']
      else
        super
      end
    end
  end
  index do
    #selectable_column
    column :nome
    if current_admin_user.admin?
      actions
    else
      actions :except => [:new]
    end
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
  menu priority: 15
  menu parent: "Buscas específicas", label:"Buscar por organizações militares"
  config.sort_order = "nome"
end
