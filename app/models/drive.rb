class Drive < ActiveRecord::Base
  belongs_to :user
  validates :organizer_id, :organization_name, :organization_blurb, :drive_title, :drive_blurb, :start_date, :end_date, :presence => true
end
