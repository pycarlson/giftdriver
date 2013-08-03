class Drive < ActiveRecord::Base

  has_many :organizers
  has_many :users, :through => :organizers
  has_many :families
  has_many :drop_locations
  has_many :drop_dates
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
                  :end_date,
                  :drop_locations_attributes,
                  :drop_dates_attributes

  validates :org_blurb,
            :org_email,
            :org_phone,
            :org_name,
            :org_address,
            :org_zipcode,
            :drive_title,
            :drive_blurb,
            :start_date,
            :end_date,
            presence: true

  validates :drive_title, :uniqueness => :true
  accepts_nested_attributes_for :drop_dates, :allow_destroy => true
  accepts_nested_attributes_for :drop_locations
  

  def user_has_dropoff_preference?(user)
    !Donor.where(user_id: user.id, drive_id: self.id).last.nil?
  end

  def donor_dropoff_pref(user)
    Donor.where(user_id: user.id, drive_id: self.id).last.drop_location_id
  end

end
