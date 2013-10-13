class ChangeFamilyMemberAgeIntegerToString < ActiveRecord::Migration
  def change
    change_column :family_members, :age, :string
  end
end
