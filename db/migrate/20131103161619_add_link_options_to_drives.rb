class AddLinkOptionsToDrives < ActiveRecord::Migration
  def change
    add_column :drives, :donation_receipt_link, :string
    add_column :drives, :shopping_details_link, :string
  end
end
