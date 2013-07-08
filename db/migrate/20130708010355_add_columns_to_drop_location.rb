class AddColumnsToDropLocation < ActiveRecord::Migration
  def change
    add_column :drop_locations, :latitude,  :float 
    add_column :drop_locations, :longitude, :float 
    add_column :drop_locations, :gmaps, :boolean 
  end
end
