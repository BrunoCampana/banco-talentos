ActiveAdmin.register AdminUser do
  permit_params :email, :password, :password_confirmation, :nome, :tipo, :status, :quartel_id

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
  filter :tipo
  filter :status
  filter :quartel
  filter :email
  filter :current_sign_in_at
  filter :sign_in_count
  filter :created_at

  show do |admin_user|
    panel 'Gerenciar usuário' do
      attributes_table_for admin_user do
        row :nome
        row :tipo
        row :status
        row :email
        row :quartel
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
      if current_admin_user.admin?
        f.input :tipo
        f.input :status
        f.input :quartel
      end
    end
    f.actions
  end

  menu priority: 11
end
