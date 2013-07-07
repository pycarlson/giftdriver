class ChangeUsersWithAccessTableName < ActiveRecord::Migration
  def change
    rename_table :users_with_access, :users_with_accesses
  end
end
