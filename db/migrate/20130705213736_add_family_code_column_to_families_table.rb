class AddFamilyCodeColumnToFamiliesTable < ActiveRecord::Migration
  def change
    add_column :families, :family_code, :string
  end
end
