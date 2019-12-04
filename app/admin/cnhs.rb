ActiveAdmin.register Cnh do

  controller do
    def action_methods
      if current_admin_user.recrutador?
        super - ['destroy', 'new', 'create']
      else
        super
      end
    end
  end

  config.sort_order = 'titulo_asc'
  index do
    if current_admin_user.admin?
      selectable_column
    end
    column :titulo
    if current_admin_user.admin?
      actions
    else
      actions :except => [:new]
    end
  end

  filter :titulo_cont, label: 'CNH'

  show do |cnh|
    panel 'cnh' do
      attributes_table_for cnh do
        row :titulo
        if not current_admin_user.recrutador?
          row :talentos
        end
      end
    end
  end
  permit_params :cnh_id, :titulo, talento_ids: []
  config.comments = false
  menu priority: 6, if: proc{not current_admin_user.recrutador?}
  menu parent: "Buscas específicas", label:"Buscar por CNH", if: proc{not current_admin_user.recrutador?}
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

end
