class Corrigirconfirmacao < ActiveRecord::Migration[5.2]
  def change
    remove_column :talentos, :email_confirmed, :boolean, :default => false
    add_column :talentos, :email_confirmed, :boolean, :default => true
  end
end
