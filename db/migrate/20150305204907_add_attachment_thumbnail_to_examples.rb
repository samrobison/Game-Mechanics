class AddAttachmentThumbnailToExamples < ActiveRecord::Migration
  def self.up
    change_table :examples do |t|
      t.attachment :thumbnail
    end
  end

  def self.down
    remove_attachment :examples, :thumbnail
  end
end
