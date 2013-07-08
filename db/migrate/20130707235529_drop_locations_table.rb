class DropLocationsTable < ActiveRecord::Migration
  def change
    create_table :drop_locations do |t|
      t.references :drive
      t.string     :street
      t.string     :city
      t.string     :state
      t.string     :zipcode
      t.string     :code
    end
  end
end
