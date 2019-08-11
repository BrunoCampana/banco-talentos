class Criarniveisacessop2 < ActiveRecord::Migration[5.2]
  def change
    add_column :admin_users, :tipo, :integer, default: 2
    add_column :admin_users, :status, :integer, default: 0
    add_reference :admin_users, :quartel, foreign_key:true
    add_column :admin_users, :nome, :string
  end
end
