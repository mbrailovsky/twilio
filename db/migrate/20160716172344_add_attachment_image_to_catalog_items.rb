class AddAttachmentImageToCatalogItems < ActiveRecord::Migration
  def self.up
    change_table :catalog_items do |t|
      t.attachment :image
    end
  end

  def self.down
    remove_attachment :catalog_items, :image
  end
end
