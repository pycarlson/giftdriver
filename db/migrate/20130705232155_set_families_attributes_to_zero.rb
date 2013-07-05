class SetFamiliesAttributesToZero < ActiveRecord::Migration
  def up
    change_column :families, :recieved_at_org, :boolean, :default => false
    change_column :families, :given_to_family, :boolean, :default => false
  end

  def down
    change_column :families, :recieved_at_org, :boolean, :default => nil
    change_column :families, :given_to_family, :boolean, :default => nil
  end
end
