class AddGmapColumnsToDrives < ActiveRecord::Migration
  def change
    add_column :drives, :latitude,  :float 
    add_column :drives, :longitude, :float 
    add_column :drives, :gmaps, :boolean 
  end
end
