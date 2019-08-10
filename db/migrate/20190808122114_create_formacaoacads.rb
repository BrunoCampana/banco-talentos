class CreateFormacaoacads < ActiveRecord::Migration[5.2]
  def change
    create_table :formacaoacads do |t|
      t.string :titulo, null: false
      t.string :instituicao
      t.integer :nivel
      t.date :ano_formacao
      t.timestamps
    end
  end
end
