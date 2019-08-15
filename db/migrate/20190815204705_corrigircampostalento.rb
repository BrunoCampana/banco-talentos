class Corrigircampostalento < ActiveRecord::Migration[5.2]
  def change
    remove_column :talentos, :cnh, :string
    remove_column :talentos, :contratacao_imediata, :integer

    add_column :talentos, :cnh, :integer, default: 0
    add_column :talentos, :contratacao_imediata, :boolean, default: 0
  end
end
