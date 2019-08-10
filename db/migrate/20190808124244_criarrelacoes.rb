class Criarrelacoes < ActiveRecord::Migration[5.2]
  def change
    create_join_table :areaatuacaos, :talentos do |t|
      t.index :areaatuacao_id
      t.index :talento_id
    end

    add_reference :cargoocupados, :talento, foreign_key:true
    add_reference :certificacaos, :talento, foreign_key:true
    add_reference :talentos, :cidade, foreign_key:true
    add_reference :cursos, :talento, foreign_key:true
    add_reference :formacaoacads, :talento, foreign_key:true
    add_reference :talentos, :formmilitar, foreign_key:true

    create_join_table :habilidades, :talentos do |t|
      t.index :habilidade_id
      t.index :talento_id
    end

    create_join_table :idiomas, :talentos do |t|
      t.index :idioma_id
      t.index :talento_id
    end

    add_reference :talentos, :quartel, foreign_key:true
  end
end
