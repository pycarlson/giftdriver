class CreateDropDatesTable < ActiveRecord::Migration
  def change
    create_table :drop_dates do |t|
      t.text :date_and_time
      t.integer :drop_location_id
    end
  end
end
