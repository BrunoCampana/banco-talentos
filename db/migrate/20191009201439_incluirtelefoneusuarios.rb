class Incluirtelefoneusuarios < ActiveRecord::Migration[5.2]
  def change
    add_column :admin_users, :teleone, :string
  end
end
