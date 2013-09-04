class AddDropDateToFamiliesTable < ActiveRecord::Migration
  def change
    add_column :families, :drop_date_id, :integer
  end
end
