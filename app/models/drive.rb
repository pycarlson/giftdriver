class Drive < ActiveRecord::Base

  has_many :organizers, :dependent => :destroy
  has_many :users, :through => :organizers
  has_many :families, :dependent => :destroy
  has_many :drop_locations, :dependent => :destroy
  has_many :drop_dates, :dependent => :destroy
  has_many :donors, :dependent => :destroy
  has_many :user_donors, :through => :donors, :source => :user

  attr_accessible :org_blurb,
                  :org_email,
                  :org_phone,
                  :org_website_url,
                  :org_name,
                  :org_address,
                  :org_zipcode,
                  :drive_title,
                  :drive_blurb,
                  :start_date,
                  :end_date,
                  :details_for_the_donor,
                  :drop_locations_attributes,
                  :drop_dates_attributes,
                  :fundraising_url,
                  :fundraising_blurb,
                  :donation_receipt_link,
                  :shopping_details_link

  validates :org_blurb,
            :org_email,
            :org_phone,
            :org_name,
            :org_address,
            :drive_title,
            :drive_blurb,
            :start_date,
            :end_date,
            presence: true

  validates :drive_title, :uniqueness => :true
  accepts_nested_attributes_for :drop_dates, :allow_destroy => true
  accepts_nested_attributes_for :drop_locations



  def delete_user_as_donor(user)
    user.donors.each do |donor|
      donor.destroy
    end
  end

  def get_families_with_no_drop_location_info
    families = self.families
    families.where('drop_location_id IS NULL')
  end

  def user_has_dropoff_preference?(user)
    !Donor.where(user_id: user.id, drive_id: self.id).last.nil?
  end

  def donor_dropoff_pref(user)
    Donor.where(user_id: user.id, drive_id: self.id).last.drop_location
  end

  def donor(user)
    donors.where(user_id: user.id).first
  end

  def multiple_dropoff_locations?
    self.drop_locations.length > 1
  end

  def set_location(current_user)
    if multiple_dropoff_locations?
      donor(current_user).drop_location
    else
      drop_locations.last
    end
  end

  def get_filtered_families(drive, location, size)
    if size == "0"
      Family.not_adopted_families_by_location(drive, location)
    elsif size == "5"
      Family.not_adopted_big_families_by_location(drive, location)
    else
      Family.not_adopted_families_by_location_and_size(drive, location, size.to_i)
    end
  end
end
