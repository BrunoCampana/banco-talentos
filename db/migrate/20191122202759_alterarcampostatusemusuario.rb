class Alterarcampostatusemusuario < ActiveRecord::Migration[5.2]
  def change
    change_column :admin_users, :status, :boolean, default: 0
  end
end
