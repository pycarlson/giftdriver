class CreateDonorsTable < ActiveRecord::Migration
  def change
    create_table :donors do |t|
      t.references :user
      t.references :drive
      t.references :drop_location
    end
  end
end
