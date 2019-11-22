class Atualizardevise < ActiveRecord::Migration[5.2]
  def change
    # t.integer  :sign_in_count, default: 0, null: false
    # t.datetime :last_sign_in_at
    # t.string   :last_sign_in_ip
    # t.integer  :failed_attempts, default: 0, null: false # Only if lock strategy is :failed_attempts
    # t.string   :unlock_token # Only if unlock strategy is :email or :both
    # t.datetime :locked_at
    #change_column :talentos, :email_confirmed, :boolean, default: false
    add_column :admin_users, :sign_in_count, :integer, default: 0, null: false
    add_column :admin_users, :last_sign_in_at, :datetime
    add_column :admin_users, :last_sign_in_ip, :string
    add_column :admin_users, :failed_attempts, :integer, default: 0, null: false
    add_column :admin_users, :unlock_token, :string
    add_column :admin_users, :locked_at, :datetime
  end
end
