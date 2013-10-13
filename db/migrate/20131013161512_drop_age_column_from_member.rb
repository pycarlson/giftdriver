class DropAgeColumnFromMember < ActiveRecord::Migration
  def change
    remove_column :family_members, :age
  end
end
