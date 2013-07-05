class AddFamilyCodeColumnToFamiliesTable < ActiveRecord::Migration
  def change
    add_column :families, :code, :string
  end
end
