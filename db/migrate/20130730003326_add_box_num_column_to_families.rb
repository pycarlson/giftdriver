class AddBoxNumColumnToFamilies < ActiveRecord::Migration
  def change
    add_column :families, :num_boxes, :integer 
  end
end
