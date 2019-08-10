class CreateCargoocupados < ActiveRecord::Migration[5.2]
  def change
    create_table :cargoocupados do |t|
      t.string :titulo, null: false
      t.text :descricao
      t.date :inicio
      t.date :termino
      t.timestamps
    end
  end
end
