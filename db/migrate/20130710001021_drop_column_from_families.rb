class DropColumnFromFamilies < ActiveRecord::Migration
  def change
    remove_column :families, :location_name_or_code
  end
end
