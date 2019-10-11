class Tirarmanualconfirmed < ActiveRecord::Migration[5.2]
  def change
    remove_column :talentos, :manual_confirmed, :boolean, :default => false
  end
end
