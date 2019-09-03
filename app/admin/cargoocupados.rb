ActiveAdmin.register Cargoocupado do

  controller do
    def action_methods
      if current_admin_user.admin?
        super
      else
        super - ['destroy', 'new', 'create']
      end
    end
  end
  #config.remove_action_item(:new)
  index do
    #selectable_column
    column :titulo
    column :descricao
    if not current_admin_user.admin?
      actions
    else
      actions :except => [:new]
    end
  end

  filter :titulo_cont, label: 'Título do cargo'
  filter :descricao_cont, label: 'Descrição do cargo'

  show do |cargoocupado|
    panel 'Cargos ocupados' do
      attributes_table_for cargoocupado do
        row :titulo
        row :descricao
        if not current_admin_user.recrutador?
          row :talentos
        end
      end
    end
  end

  #belongs_to :talento
  permit_params :titulo, :descricao, :cargoocupado_id, talento_ids: []

  form do |f|
    f.inputs do
      f.input :titulo
      f.input :descricao
    end
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
  menu priority: 5
  menu parent: "Buscas específicas", label:"Buscar por cargos ocupados"
end
