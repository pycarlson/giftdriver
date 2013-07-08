class DropAddReLocationAgain < ActiveRecord::Migration
  def change
    add_column :drop_locations, :latitude,  :float 
    add_column :drop_locations, :longitude, :float 
    add_column :drop_locations, :gmaps, :boolean 
  end

  def change
    remove_column :drives, :latitude
    remove_column :drives, :longitude 
    remove_column :drives, :gmaps
  end
end
