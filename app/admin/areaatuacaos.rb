ActiveAdmin.register Areaatuacao do

 permit_params :titulo, :areaatuacao_id, talento_ids: []

  index do
    #selectable_column
    column :titulo
    actions
  end

  filter :titulo_cont, label: 'Título'

  show do |areaatuacao|
    panel 'Áreas de Atuação' do
      attributes_table_for areaatuacao do
        row :titulo
        row :talentos
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
  menu priority: 3
  menu parent: "Buscar por capacitação", label:"Buscar por área de atuação"

  config.sort_order = "titulo"
end
