ActiveAdmin.register AdminUser do
  permit_params :email, :password, :password_confirmation, :nome, :tipo, :status, :quartel_id, :cpf
  menu #:if => proc{ current_admin_user.admin? }

  scope :usuarios, :default => true do |admin_users|
    if current_admin_user.admin?
      admin_users.all
    else
      admin_users.where(:quartel_id => current_admin_user.quartel_id)
    end
  end

  index do
    selectable_column
    id_column
    column :nome
    column :tipo
    column :status
    column :email
    column :quartel
    column :current_sign_in_at
    column :sign_in_count
    actions
  end

  filter :nome
  filter :tipo, as: :searchable_select
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
        row :current_sign_in_at
        row :sign_in_count
        row :created_at
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
        f.input :status
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
