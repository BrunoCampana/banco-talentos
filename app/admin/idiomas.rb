ActiveAdmin.register Idioma do

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
    column :lingua_nivel
    if current_admin_user.admin?
      actions
    else
      actions :except => [:new]
    end
  end

  filter :lingua_nivel_cont, label: 'Idioma'

  show do |idioma|
    panel 'Idioma' do
      attributes_table_for idioma do
        row :lingua_nivel
        if not current_admin_user.recrutador?
          row :talentos
        end
      end
    end
  end
  permit_params :idioma_id, :lingua_nivel ,talento_ids: []

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
  menu priority: 13, if: proc{not current_admin_user.recrutador?}
  menu parent: "Buscas específicas", label:"Buscar por idiomas que fala", if: proc{not current_admin_user.recrutador?}
end
