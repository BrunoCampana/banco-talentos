ActiveAdmin.register Areaatuacao do

  permit_params :titulo, :areaatuacao_id, talento_ids: []
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

  filter :titulo_cont, label: 'Título'

  show do |areaatuacao|
    panel 'Áreas de Atuação' do
      attributes_table_for areaatuacao do
        row :titulo
        if not current_admin_user.recrutador?
          row :talentos
        end
      end
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

  menu priority: 10, if: proc{not current_admin_user.recrutador?}
  menu parent: "Buscas específicas", label:"Buscar por área de atuação", if: proc{not current_admin_user.recrutador?}

  #menu priority: 10
  #menu parent: "Buscas específicas", label:"Buscar por área de atuação"
end
