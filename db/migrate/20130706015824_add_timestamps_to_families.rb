class AddTimestampsToFamilies < ActiveRecord::Migration
  def change
    add_column :families, :created_at, :datetime
  end
end
