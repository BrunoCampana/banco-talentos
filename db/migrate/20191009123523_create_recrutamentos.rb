class CreateRecrutamentos < ActiveRecord::Migration[5.2]
  def change
    create_table :recrutamentos do |t|
      t.string :nome, null: false
      t.date :inicio
      t.date :termino
      t.text :o_que_procura
      t.integer :estado, default: 0
      t.timestamps
    end
    create_join_table :recrutamentos, :talentos do |t|
      t.index :recrutamento_id
      t.index :talento_id
    end
    add_reference :recrutamentos, :quartel, foreign_key:true
    add_reference :recrutamentos, :admin_user, foreign_key:true
  end
end
