class Alterardevisedenovo < ActiveRecord::Migration[5.2]
  def change
    add_index :admin_users, :unlock_token, unique: true
  end
end
