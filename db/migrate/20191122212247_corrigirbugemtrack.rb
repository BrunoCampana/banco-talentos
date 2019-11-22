class Corrigirbugemtrack < ActiveRecord::Migration[5.2]
  def change
    # t.datetime :current_sign_in_at
    # t.string   :current_sign_in_ip
    add_column :admin_users, :current_sign_in_at, :datetime
    add_column :admin_users, :current_sign_in_ip, :string
  end
end
