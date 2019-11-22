ActiveAdmin.register Recrutamento do

  controller do
    def action_methods
      if current_admin_user.admin?
        super
      elsif current_admin_user.recrutador?
        super - ['destroy']
      else
        super - ['destroy', 'new', 'create']
      end
    end
  end

  if proc{current_admin_user.admin?}
    actions :all
  elsif proc{current_admin_user.recrutador?}
    actions :all
  else
    actions :index, :show
  end

  scope :processos, :default => true do |recrutamentos|
    if not current_admin_user.recrutador?
      recrutamentos.all
    else
      recrutamentos.where(:quartel_id => current_admin_user.quartel_id)
    end
  end

  index do
    if current_admin_user.admin?
      selectable_column
    end
    column :quartel
    column :nome
    column :inicio
    column :estado
    column :termino
    actions
  end

  filter :nome
  filter :inicio
  filter :estado, as: :searchable_select, multiple: true, collection: Recrutamento.estados
  filter :o_que_procura
  #if not proc{ current_admin_user.recrutador?}
  #  filter :quartel, as: :searchable_select, multiple: true, colletion: Quartel.where(:tipo => '1')
  #end
  filter :talentos, as: :searchable_select, multiple: true

  show do |recrutamento|
    panel 'Processo de Recrutamento' do
      attributes_table_for recrutamento do
        row :quartel
        row :nome
        row :inicio
        row :estado
        row :o_que_procura
        row :admin_user
        row :talentos
        row :termino
      end
    end
  end

  permit_params :recrutamento_id, :nome, :inicio, :termino, :o_que_procura, :estado, :quartel_id, :admin_user_id, talento_ids: []

  form html: { multipart: true } do |f|
    f.inputs "Processo de Recrutamento" do
      if f.object.new_record?
        input :quartel, collection: Quartel.where(:id => current_admin_user.quartel_id)
      end
      f.input :nome, :hint => "Crie um nome que descreva e diferencie esse processo de recrutamento dos seus outros"
      f.input :o_que_procura, :hint => "Explique sucintamente quais cargos busca ocupar nessa busca por profissionais"
      f.input :estado, :hint => "Descreve o status atual deste processo de recrutamento"
      if f.object.new_record?
        f.input :inicio, as: :date_time_picker, picker_options: { min_date: Date.current, max_date: Date.current, timepicker:false}
      end
      f.input :talentos, :hint => "Selecione os talentos que lhe interessaram para os cargos que deseja ocupar", collection: Talento.where(:aval_cmt => true)
      if f.object.new_record?
        input :admin_user, collection: AdminUser.where(:id => current_admin_user.id)
      end
      if f.object.persisted?
          f.input :termino, as: :date_time_picker, picker_options: { min_date: Date.current, max_date: Date.current, timepicker:false}
      end
    end
    f.actions
  end
  menu priority: 3, label: "Processos de Recrutamento"
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

=begin
  if proc{current_admin_user.admin?}
    actions :all
  elsif proc{current_admin_user.recrutador?}
    actions :all, except: [:destroy]
  else
    actions :all, except: [:update, :destroy, :create, :new]
  end
=end

#if f.object.persisted?
#  if f.object.estado_changed?
#    if f.object.estado == 4
#      f.object.termino = DateTime.now
#    end
#  end
#end
#as: :date_time_picker, picker_options: { min_date: Date.current, max_date: Date.current, timepicker:false}
