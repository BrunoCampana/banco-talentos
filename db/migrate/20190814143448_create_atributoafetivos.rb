class CreateAtributoafetivos < ActiveRecord::Migration[5.2]
  def change
    create_table :atributoafetivos do |t|
      t.string :titulo, null: false
      t.timestamps
    end
  end
end
