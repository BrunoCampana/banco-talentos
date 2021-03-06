ActiveAdmin.register AdminUser, as: "User" do
  permit_params :email, :password, :password_confirmation, :nome, :tipo, :status, :quartel_id, :cpf, :teleone, :created_at, :updated_at, :sign_in_count, :last_sign_in_at, :last_sign_in_ip, :failed_attempts, :unlock_token, :locked_at
  menu #:if => proc{ current_admin_user.admin? }

  scope :usuarios, :default => true do |admin_users|
    if current_admin_user.admin?
      admin_users.all
    else
      admin_users.where(:quartel_id => current_admin_user.quartel_id)
    end
  end

  config.sort_order = 'nome_asc'
  index do
    if current_admin_user.admin?
      selectable_column
    end
    id_column
    column :nome
    column :tipo
    if current_admin_user.admin?
      toggle_bool_column :status, success_message: 'Perfil atualizado com sucesso!'
    end
    column :email
    column :quartel
    if current_admin_user.admin?
      column :last_sign_in_at
      column :sign_in_count
    end
    actions
  end

  filter :nome
  filter :tipo, as: :searchable_select, multiple:true, collection: AdminUser.tipos
  filter :status, as: :searchable_select
  filter :quartel
  filter :email
  filter :current_sign_in_at
  filter :sign_in_count
  filter :created_at

  show do |admin_user|
    panel 'Gerenciar usuário' do
      attributes_table_for admin_user do
        row :nome
        row :cpf
        row :tipo
        row :status
        row :email
        row :quartel
        row :teleone
        if current_admin_user.admin?
          row :created_at
          row :updated_at
          row :sign_in_count
          row :last_sign_in_at
          row :last_sign_in_ip
          row :failed_attempts
          row :locked_at
          row :current_sign_in_at
          row :current_sign_in_ip
        end
      end
    end
  end

  form do |f|
    f.inputs do
      f.input :nome
      f.input :email
      f.input :password
      f.input :password_confirmation
      f.input :teleone, :hint => "Apenas números, todos juntos. Ex:9299911133"
      if current_admin_user.admin?
        f.input :cpf, :hint => "Insira somente os 11 dígitos, todos juntos, sem traços e pontos separadores. Ex: 11122233344"
        f.input :tipo
        f.input :status, :label => "Ativar usuário?"
        f.input :quartel
      end
    end
    f.actions
  end

  #menu priority: 11
  #after_build do |currm|
  #  currm.admin_user = current_admin_user
  #end
end
