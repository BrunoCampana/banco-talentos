class Datasprocessorefeito < ActiveRecord::Migration[5.2]
  def change
    remove_column :recrutamentos, :inicio, :datetime
    remove_column :recrutamentos, :termino, :datetime
    add_column :recrutamentos, :inicio, :date
    add_column :recrutamentos, :termino, :date
  end
end
