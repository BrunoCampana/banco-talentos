class Adicionarcolunasemuser < ActiveRecord::Migration[5.2]
  def change
    add_column :admin_users, :tipo, :integer
  end
end
