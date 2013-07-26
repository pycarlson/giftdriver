class AddColumnToDonors < ActiveRecord::Migration
  def change
    add_column :donors, :family_id, :integer
  end
end
