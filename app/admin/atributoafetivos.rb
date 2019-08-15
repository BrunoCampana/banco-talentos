ActiveAdmin.register Atributoafetivo do

  index do
    #selectable_column
    column :titulo
    if current_admin_user.admin?
      actions
    else
      actions :except => [:new]
    end
  end

  filter :titulo_cont, label: 'Atributo da área afetiva'

  show do |atributoafetivo|
    panel 'Atributos da área afetiva' do
      attributes_table_for habilidade do
        row :titulo
        row :talentos
      end
    end
  end
  permit_params :atributoafetivo_id, :titulo, talento_ids: []

  config.comments = false
  menu priority: 9
  menu parent: "Buscas específicas", label:"Buscar por atributos afetivos"
  config.sort_order = "titulo"

end
