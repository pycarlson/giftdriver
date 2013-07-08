class CorrectFamiliesColumnName < ActiveRecord::Migration
  def change
    rename_column :families, :location_id, :drop_location_id
  end
end
