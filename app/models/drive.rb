class Drive < ActiveRecord::Base
  belongs_to :user

  attr_accessible :org_blurb,
                  :org_email,
                  :org_phone,
                  :org_name,
                  :org_address,
                  :org_zipcode,
                  :drop_location,
                  :drive_title,
                  :drive_blurb,
                  :start_date,
                  :end_date

  # validates :organizer_id, :organization_name, :organization_blurb, :drive_title, :drive_blurb, :start_date, :end_date, :presence => true
end
