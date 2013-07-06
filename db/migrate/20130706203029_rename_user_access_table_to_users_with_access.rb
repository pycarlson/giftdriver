class RenameUserAccessTableToUsersWithAccess < ActiveRecord::Migration
  def change
    rename_table :user_access, :users_with_access
  end
end
