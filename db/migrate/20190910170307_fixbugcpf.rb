class Fixbugcpf < ActiveRecord::Migration[5.2]
  def change
    remove_column :talentos, :cpf, :integer
    add_column :talentos, :cpf, :string
  end
end
