class RenameFamilyCode < ActiveRecord::Migration
  def change
    rename_column :families, :code, :code
  end
end
