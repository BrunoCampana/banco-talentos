class AddAttachmentConsentimentoToTalentos < ActiveRecord::Migration[5.2]
  def self.up
    change_table :talentos do |t|
      t.attachment :consentimento
    end
  end

  def self.down
    remove_attachment :talentos, :consentimento
  end
end
