class AddDropDatePrefToDonors < ActiveRecord::Migration
  def change
    add_column :donors, :drop_date_id, :integer
  end
end
