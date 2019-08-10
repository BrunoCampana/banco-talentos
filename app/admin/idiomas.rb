ActiveAdmin.register Idioma do

  index do
    #selectable_column
    column :lingua_nivel
    actions
  end

  filter :lingua_nivel_cont, label: 'Idioma'

  show do |idioma|
    panel 'Idioma' do
      attributes_table_for idioma do
        row :lingua_nivel
        row :talentos
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
  menu priority: 8
  menu parent: "Buscar por capacitação", label:"Buscar por idiomas que fala"
end
