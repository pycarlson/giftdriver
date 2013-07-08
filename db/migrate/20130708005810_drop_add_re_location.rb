class DropAddReLocation < ActiveRecord::Migration
  def change
    add_column :drop_locations, :latitude,  :float 
    add_column :drop_locations, :longitude, :float 
    add_column :drop_locations, :gmaps, :boolean 
  end

  def change
    remove_column :drives, :latitude,  :float 
    remove_column :drives, :longitude, :float 
    remove_column :drives, :gmaps, :boolean 
  end
end
