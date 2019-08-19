ActiveAdmin.register Certificacao do
  #belongs_to :talento
  #config.remove_action_item(:new)
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
    column :area
    if not current_admin_user.recrutador?
      actions
    else
      actions :except => [:new]
    end
  end

  filter :titulo_cont, label: 'Título'
  filter :area_cont, label: 'Área de conhecimento'

  show do |certificacao|
    panel 'Certificação' do
      attributes_table_for certificacao do
        row :titulo
        row :area
        if not current_admin_user.recrutador?
          row :talentos
        end
      end
    end
  end
  permit_params :certificacao_id, :titulo, :area, talento_ids: []

  form do |f|
    f.input :titulo
    f.input :area
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
  menu priority: 8
  menu parent: "Buscas específicas", label:"Buscar por Certificações que possui"
end
