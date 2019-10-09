class Criarcartarecomnd < ActiveRecord::Migration[5.2]
  def change
    add_column :talentos, :carta_recomendacao, :boolean, default: 0
  end
end
