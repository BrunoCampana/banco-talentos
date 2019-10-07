ActiveAdmin.register Formmilitar do

  controller do
    def action_methods
      if current_admin_user.recrutador?
        super - ['destroy', 'new', 'create']
      else
        super
      end
    end
  end
  index do
    #selectable_column
    column :titulo
    if current_admin_user.admin?
      actions
    else
      actions :except => [:new]
    end
  end

  filter :titulo_cont, label: 'Título'

  show do |formmilitar|
    panel 'Formação Militar' do
      attributes_table_for formmilitar do
        row :titulo
        if not current_admin_user.recrutador?
          row :talentos
        end
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
  menu priority: 12, if: proc{not current_admin_user.recrutador?}
  menu parent: "Buscas específicas", label:"Buscar por formação militar", if: proc{not current_admin_user.recrutador?}
  config.sort_order = "titulo"
end
