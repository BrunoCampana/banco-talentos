class CreateIdiomas < ActiveRecord::Migration[5.2]
  def change
    create_table :idiomas do |t|
      t.string :lingua_nivel, null: false
      t.timestamps
    end
  end
end
