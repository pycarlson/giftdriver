class OrganizerAdminFunctionality < ActiveRecord::Migration
  def change
    create_table :user_access do |t|
      t.integer  :user_id
      t.integer  :drive_id
      t.boolean  :organizer

      t.timestamps
    end
  end
end
