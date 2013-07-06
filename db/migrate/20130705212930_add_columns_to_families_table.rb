class AddColumnsToFamiliesTable < ActiveRecord::Migration
  def change
    add_column :families, :adopted_by, :integer
    add_column :families, :received_at_org, :boolean
    add_column :families, :given_to_family, :boolean
  end
end
