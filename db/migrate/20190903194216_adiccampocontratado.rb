class Adiccampocontratado < ActiveRecord::Migration[5.2]
  def change
    add_column :talentos, :contratado, :boolean, default: 0
  end
end
