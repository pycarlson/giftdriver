class DropDonorIdFamilies < ActiveRecord::Migration
  def change
    remove_column :families, :donor_id
  end
end
