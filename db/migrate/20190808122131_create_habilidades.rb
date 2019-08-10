class CreateHabilidades < ActiveRecord::Migration[5.2]
  def change
    create_table :habilidades do |t|
      t.string :titulo, null: false
      t.timestamps
    end
  end
end
