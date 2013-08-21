class ChangeFamiliesGiftStatusType < ActiveRecord::Migration
  change_table :families do |t|
    t.change :given_to_family, :string
    t.change :received_at_org, :string 
  end
end
