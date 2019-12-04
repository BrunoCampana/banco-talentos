ActiveAdmin.register Quartel do

  controller do
    def action_methods
      if current_admin_user.recrutador?
        super - ['destroy', 'new', 'create']
      else
        super
      end
    end
  end

  config.sort_order = 'nome_asc'
  index do
    if current_admin_user.admin?
      selectable_column
    end
    column :nome
    if current_admin_user.admin?
      actions
    else
      actions :except => [:new]
    end
  end

  filter :nome_cont, label: 'Organização'
  filter :tipo, as: :searchable_select, collection: Quartel.tipos

  show do |quartel|
    panel 'Organização' do
      attributes_table_for quartel do
        row :nome
        if not current_admin_user.recrutador?
          row :talentos
          row :quantos_perfis_da_om?
          row :tipo
        end
      end
    end
  end
  permit_params :quartel_id, :nome, :talentos, :tipo

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
  menu priority: 15, if: proc{not current_admin_user.recrutador?}
  menu parent: "Buscas específicas", label:"Buscar por organizações", if: proc{not current_admin_user.recrutador?}
end
