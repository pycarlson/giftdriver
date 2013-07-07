class RenameUsersWithAccessesTable < ActiveRecord::Migration
  def change
    rename_table :users_with_accesses, :organizers 
  end
end
