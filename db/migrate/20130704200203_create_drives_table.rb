class CreateDrivesTable < ActiveRecord::Migration
  def change
    create_table :drives do |t|
      t.string   :org_name
      t.text     :org_blurb
      t.string   :org_email
      t.string   :org_phone
      t.string   :org_address
      t.string   :org_zipcode
      t.string   :drop_location
      t.string   :drive_title
      t.text     :drive_blurb
      t.string   :start_date
      t.string   :end_date
      t.references  :user

      t.timestamps
    end
  end
end
