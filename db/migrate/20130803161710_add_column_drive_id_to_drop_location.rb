class AddColumnDriveIdToDropLocation < ActiveRecord::Migration
  def change
    add_column :drop_dates, :drive_id, :integer
  end
end
