class CreateAreaatuacaos < ActiveRecord::Migration[5.2]
  def change
    create_table :areaatuacaos do |t|
      t.string :titulo, null: false
      t.timestamps
    end
  end
end
