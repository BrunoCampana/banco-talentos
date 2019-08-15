class CreateFormmilitars < ActiveRecord::Migration[5.2]
  def change
    create_table :formmilitars do |t|
      t.string :titulo, null: false
      t.timestamps
    end
  end
end
