class AddAttachmentFotoToTalentos < ActiveRecord::Migration[5.2]
  def self.up
    change_table :talentos do |t|
      t.attachment :foto
    end
  end

  def self.down
    remove_attachment :talentos, :foto
  end
end
