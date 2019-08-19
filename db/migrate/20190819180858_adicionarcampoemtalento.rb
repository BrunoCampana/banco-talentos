class Adicionarcampoemtalento < ActiveRecord::Migration[5.2]
  def change
    add_column :talentos, :tel_ctt2, :string
  end
end
