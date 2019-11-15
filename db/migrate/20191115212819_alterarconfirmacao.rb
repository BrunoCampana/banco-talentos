class Alterarconfirmacao < ActiveRecord::Migration[5.2]
  def change
    change_column :talentos, :email_confirmed, :boolean, default: false
  end
end
