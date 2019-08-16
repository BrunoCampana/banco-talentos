class CreateCnhs < ActiveRecord::Migration[5.2]
  def change
    create_table :cnhs do |t|
      t.string :titulo, null: false
      t.timestamps
    end
    create_join_table :cnhs, :talentos do |t|
      t.index :cnh_id
      t.index :talento_id
    end
  end
end
