class CreateDrivesTable < ActiveRecord::Migration
  def change
    create_table :drives do |t|
      t.integer  :organizer_id
      t.string   :organization_name
      t.text     :organization_blurb
      t.string   :drive_title
      t.text     :drive_blurb
      t.string   :start_date
      t.string   :end_date

      t.timestamps
    end
  end
end
