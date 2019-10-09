class Datasprocesso < ActiveRecord::Migration[5.2]
  def change
    remove_column :recrutamentos, :inicio, :date
    remove_column :recrutamentos, :termino, :date
    add_column :recrutamentos, :inicio, :datetime
    add_column :recrutamentos, :termino, :datetime
  end
end
