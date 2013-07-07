class DropUserIdFromDrives < ActiveRecord::Migration
  def change
    remove_column :drives, :user_id
  end
end
