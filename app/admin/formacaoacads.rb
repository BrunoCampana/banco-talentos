ActiveAdmin.register Formacaoacad do
  #config.remove_action_item(:new)
  #belongs_to :talento

  controller do
    def action_methods
      if not current_admin_user.admin?
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
    if not current_admin_user.admin?
      actions
    else
      actions :except => [:new]
    end
  end

  filter :titulo_cont, label: 'Título'

  show do |formacaoacad|
    panel 'Formação Acadêmica' do
      attributes_table_for formacaoacad do
        row :titulo
        if not current_admin_user.recrutador?
          row :talento
        end
      end
    end
  end
  permit_params :formacaoacad_id, :titulo, talento_ids: []

  form do |f|
    f.input :titulo
    f.actions
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
  menu priority: 7, if: proc{not current_admin_user.recrutador?}
  menu parent: "Buscas específicas", label:"Buscar por formação acadêmica", if: proc{not current_admin_user.recrutador?}
end
