class AddLocationIdToFamilies < ActiveRecord::Migration
  def change
    add_column :families, :location_id, :integer
  end
end
