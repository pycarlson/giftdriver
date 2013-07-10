class AddColumnLocationCodeToFamiliesTable < ActiveRecord::Migration
  def change
    add_column :families, :location_name_or_code, :string
  end
end
