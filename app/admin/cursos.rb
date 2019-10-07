ActiveAdmin.register Curso do
  #config.remove_action_item(:new)
  controller do
    def action_methods
      if current_admin_user.admin?
        super
      else
        super - ['destroy', 'new', 'create']
      end
    end
  end
  index do
    #selectable_column
    column :titulo
    if not current_admin_user.admin?
      actions
    else
      actions :except => [:new]
    end
  end

  filter :titulo_cont, label: 'Título do curso'

  show do |curso|
    panel 'Curso' do
      attributes_table_for curso do
        row :titulo
        if not current_admin_user.recrutador?
          row :talentos
        end
      end
    end
  end
  #belongs_to :talento
  permit_params :curso_id, :titulo, talento_ids: []

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
  menu priority: 5, if: proc{not current_admin_user.recrutador?}
  menu parent: "Buscas específicas", label:"Buscar por cursos que possui", if: proc{not current_admin_user.recrutador?}
end
