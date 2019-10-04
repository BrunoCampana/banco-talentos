class Alteracoesposentrega < ActiveRecord::Migration[5.2]
  def change
    remove_column :talentos, :altura, :string
    remove_column :talentos, :peso, :string
    remove_column :talentos, :status_atual, :integer
    remove_column :talentos, :assiduidade, :integer
    remove_column :talentos, :pontualidade, :integer
    remove_column :talentos, :disciplina, :integer
    remove_column :talentos, :lideranca, :integer
    remove_column :talentos, :apresentacao, :integer
    remove_column :talentos, :dedicacao, :integer
    remove_column :talentos, :iniciativa, :integer
    remove_column :talentos, :produtividade, :integer
    remove_column :talentos, :comunicacao, :integer
    remove_column :talentos, :estab_emocional, :integer
    remove_column :talentos, :resistencia_fisica, :integer
    remove_column :talentos, :parecer_cmt, :text
    remove_column :talentos, :pretensao_salario, :string
    remove_column :talentos, :area_procurada, :string
    #remove_column :talentos, :pretensao_salario, :string
    remove_column :talentos, :nivel_formacao_cargo, :integer
    #remove_column :talentos, :pretensao_salario, :string
    remove_column :talentos, :cpf, :string

    add_column :talentos, :bairro, :string
    add_column :talentos, :contratacao_imediata, :integer, default: 0
    add_column :talentos, :quando_disponivel, :string
    add_column :talentos, :aval_cmt, :integer, default: 0
    add_column :talentos, :nome_referencia, :string
    add_column :talentos, :cel_referencia, :string
    add_column :talentos, :email_referencia, :string
    add_column :talentos, :cnh, :string, default: 0
    add_column :talentos, :cpf, :integer

    create_join_table :atributoafetivos, :talentos do |t|
      t.index :atributoafetivo_id
      t.index :talento_id
    end
  end
end
