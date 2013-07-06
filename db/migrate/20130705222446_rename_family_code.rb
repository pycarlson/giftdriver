class RenameFamilyCode < ActiveRecord::Migration
  def change
    rename_column :families, :family_code, :code
  end
end
