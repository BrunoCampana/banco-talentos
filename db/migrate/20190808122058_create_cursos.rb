class CreateCursos < ActiveRecord::Migration[5.2]
  def change
    create_table :cursos do |t|
      t.string :titulo, null: false
      t.date :quando_ocorreu
      t.string :quem_ministrou
      t.integer :carga_horaria
      t.integer :modalidade
      t.timestamps
    end
  end
end
