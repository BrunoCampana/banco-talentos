class AddAttachmentCurriculoToTalentos < ActiveRecord::Migration[5.2]
  def self.up
    change_table :talentos do |t|
      t.attachment :curriculo
    end
  end

  def self.down
    remove_attachment :talentos, :curriculo
  end
end
