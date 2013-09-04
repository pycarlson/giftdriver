class DropColumnFromDonors < ActiveRecord::Migration
  def change
    remove_column :donors, :drop_date_id
  end
end
