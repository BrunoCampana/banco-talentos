class Alteraravalcmt < ActiveRecord::Migration[5.2]
  def change
    remove_column :talentos, :aval_cmt, :integer

    add_column :talentos, :aval_cmt, :boolean, default: 0
  end
end
