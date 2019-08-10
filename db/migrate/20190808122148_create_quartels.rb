class CreateQuartels < ActiveRecord::Migration[5.2]
  def change
    create_table :quartels do |t|
      t.string :nome, null: false
      t.timestamps
    end
  end
end
