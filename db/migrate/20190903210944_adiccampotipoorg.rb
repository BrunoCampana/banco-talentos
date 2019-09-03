class Adiccampotipoorg < ActiveRecord::Migration[5.2]
  def change
    remove_column :talentos, :contratado, :boolean, default: 0
    add_column :quartels, :tipo, :integer, default: 0
  end
end
