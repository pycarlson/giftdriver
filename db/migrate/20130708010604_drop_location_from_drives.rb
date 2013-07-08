class DropLocationFromDrives < ActiveRecord::Migration
  def change
    remove_column :drives, :drop_location
  end
end
