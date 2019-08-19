class Melhorarbuscas < ActiveRecord::Migration[5.2]
  def change
    remove_column :cargoocupados, :inicio, :date
    remove_column :cargoocupados, :termino, :date
    remove_reference :cargoocupados, :talento, foreign_key:true

    create_join_table :cargoocupados, :talentos do |t|
      t.index :cargoocupado_id
      t.index :talento_id
    end

    remove_column :certificacaos, :ano_obtencao, :date
    remove_reference :certificacaos, :talento, foreign_key:true

    create_join_table :certificacaos, :talentos do |t|
      t.index :certificacao_id
      t.index :talento_id
    end

    remove_column :cursos, :quando_ocorreu, :date
    remove_column :cursos, :quem_ministrou, :string
    remove_column :cursos, :carga_horaria, :integer
    remove_column :cursos, :modalidade, :integer
    remove_reference :cursos, :talento, foreign_key:true

    create_join_table :cursos, :talentos do |t|
      t.index :curso_id
      t.index :talento_id
    end

    remove_column :formacaoacads, :instituicao, :string
    remove_column :formacaoacads, :nivel, :integer
    remove_column :formacaoacads, :ano_formacao, :date
    remove_reference :formacaoacads, :talento, foreign_key:true

    create_join_table :formacaoacads, :talentos do |t|
      t.index :formacaoacad_id
      t.index :talento_id
    end
  end
end
