ActiveAdmin.register Curso do

  index do
    #selectable_column
    column :titulo
    column :quando_ocorreu
    column :carga_horaria
    column :modalidade
    column :quem_ministrou
    actions
  end

  filter :titulo_cont, label: 'Título do curso'

  show do |curso|
    panel 'Curso' do
      attributes_table_for curso do
        row :titulo
        row :quando_ocorreu
        row :carga_horaria
        row :modalidade
        row :quem_ministrou
        row :talento
      end
    end
  end
  #belongs_to :talento
  permit_params :curso_id, :titulo, :quando_ocorreu, :quem_ministrou, :carga_horaria, :modalidade, :talento_id

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
  menu parent: "Buscar por capacitação", label:"Buscar por cursos que possui"
end
