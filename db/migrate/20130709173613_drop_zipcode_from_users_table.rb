class DropZipcodeFromUsersTable < ActiveRecord::Migration
  def change
    remove_column :users, :zipcode
  end
end
