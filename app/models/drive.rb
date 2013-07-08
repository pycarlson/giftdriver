class Drive < ActiveRecord::Base

  has_many :organizers
  has_many :users, :through => :organizers
  has_many :families
  has_many :drop_locations
  has_many :donors
  has_many :user_donors, :through => :donors, :source => :user

  attr_accessible :org_blurb,
                  :org_email,
                  :org_phone,
                  :org_name,
                  :org_address,
                  :org_zipcode,
                  :drive_title,
                  :drive_blurb,
                  :start_date,
                  :end_date

  validates :org_blurb,
            :org_email,
            :org_phone,
            :org_name,
            :org_address,
            :org_zipcode,
            :drive_title,
            :drive_blurb,
            :start_date,
            :end_date, presence: true

  validates :drive_title, :uniqueness => :true

end
