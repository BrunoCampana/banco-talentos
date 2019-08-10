class CreateTalentos < ActiveRecord::Migration[5.2]
  def change
    create_table :talentos do |t|
      t.string :nome_completo, null: false
      t.integer :genero, default: 0
      t.date :nascimento
      t.string :cpf
      t.string :idt
      t.integer :estado_civil, default: 0
      t.string :nome_pai
      t.string :nome_mae
      t.integer :pcd, default: 0
      t.string :altura
      t.string :peso

      t.string :email
      t.string :celular
      t.string :endereco
      t.string :linkedin
      t.string :facebook
      t.string :instagram

      t.integer :status_atual, default: 0
      t.text :cargos_pre_eb

      t.integer :hierarquia, default: 0
      t.string :ndg
      t.date :data_praca
      t.date :data_desligamento

      t.integer :assiduidade, default: 0
      t.integer :pontualidade, default: 0
      t.integer :disciplina, default: 0
      t.integer :lideranca, default: 0
      t.integer :apresentacao, default: 0
      t.integer :dedicacao, default: 0
      t.integer :iniciativa, default: 0
      t.integer :produtividade, default: 0
      t.integer :comunicacao, default: 0
      t.integer :estab_emocional, default: 0
      t.integer :resistencia_fisica, default: 0
      t.text :parecer_cmt

      t.integer :disponibilidade, default: 0
      t.string :pretensao_salario
      t.string :area_procurada
      t.integer :nivel_formacao_cargo, default: 0
      t.integer :viajar, default: 0
      t.integer :mudar, default: 0

      t.timestamps
    end
  end
end
