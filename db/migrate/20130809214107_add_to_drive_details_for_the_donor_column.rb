class AddToDriveDetailsForTheDonorColumn < ActiveRecord::Migration
  def change
    add_column :drives, :details_for_the_donor, :text
  end
end
