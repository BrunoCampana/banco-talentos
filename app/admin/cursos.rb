ActiveAdmin.register Curso do
  config.remove_action_item(:new)
  controller do
    def action_methods
      if current_admin_user.recrutador?
        super - ['destroy', 'new', 'create', 'show']
      else
        super
      end
    end
  end
  index do
    #selectable_column
    column :titulo
    column :quando_ocorreu
    column :carga_horaria
    column :modalidade
    column :quem_ministrou
    actions :except => [:new]
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

  form do |f|
    f.input :titulo
    f.input :quando_ocorreu, as: :date_time_picker, datepicker_options: { min_date: "1960-01-01", max_date: "2050-01-01", timepicker:false}
    f.input :carga_horaria
    f.input :modalidade
    f.input :quem_ministrou
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
  menu parent: "Buscas específicas", label:"Buscar por cursos que possui"
end
