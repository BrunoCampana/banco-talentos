class Adiccpfusu < ActiveRecord::Migration[5.2]
  def change
    add_column :admin_users, :cpf, :string
  end
end
