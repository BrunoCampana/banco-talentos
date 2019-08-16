class Ajustandocnh < ActiveRecord::Migration[5.2]
  def change
    remove_column :talentos, :cnh, :integer
  end
end
