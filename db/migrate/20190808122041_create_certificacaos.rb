class CreateCertificacaos < ActiveRecord::Migration[5.2]
  def change
    create_table :certificacaos do |t|
      t.string :titulo, null: false
      t.string :area
      t.date :ano_obtencao
      t.timestamps
    end
  end
end
