class Criarniveisacesso < ActiveRecord::Migration[5.2]
  def change
    remove_column :admin_users, :tipo, :integer
  end
end
