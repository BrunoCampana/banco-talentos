class Adfuncpoliticaprivacidade < ActiveRecord::Migration[5.2]
  def change
    add_column :talentos, :email_confirmed, :boolean, :default => false
    add_column :talentos, :confirm_token, :string
    add_column :talentos, :manual_confirmed, :boolean, :default => false
  end
end
