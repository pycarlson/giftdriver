class Family < ActiveRecord::Base
  has_many :family_members
  validates :code, :presence => :true
  belongs_to :drive
  attr_accessible :code, :drop_location
  belongs_to :drop_location
  belongs_to :user


  attr_accessible :num_boxes, :received_at_org, :given_to_family, :drop_locations_attributes, :users_attributes
  accepts_nested_attributes_for :drop_location
  accepts_nested_attributes_for :user
  
  
  def adopted?
    self.adopted_by != nil
  end

  def get_adopter_email
    user = User.find(self.adopted_by)
    user.email
  end

  def get_adopter_name
    user = User.find(self.adopted_by)
    user.full_name
  end

  def get_adopter_address
    user = User.find(self.adopted_by)
    "#{user.street}, #{user.city}, #{user.state}, #{user.zipcode}"
  end

  def get_adopter_phone
    user = User.find(self.adopted_by)
    user.phone
  end

   def get_adopter_company
    user = User.find(self.adopted_by)
    user.company ? user.company : "n/a"
  end

  def get_adopter_drop_location_dates
    loc_id = current_user.donors.find_by_drive_id(1).drop_location_id
    DropLocation.find(loc_id).drop_dates
  end

  def self.not_adopted_families(drive)
    Drive.find(drive).families.where('adopted_by IS NULL')
  end

  def self.adopted_families(drive)
    Drive.find(drive).families.where('adopted_by IS NOT NULL')
  end

  def self.not_adopted_families_by_size(drive, family_size)
    families = Drive.find(drive).families.where('adopted_by IS NULL')
    families.map { |family| family if family.family_members.length == family_size }.compact
  end

  def self.not_adopted_families_by_location(drive, location)
    families = Drive.find(drive).families.where('adopted_by IS NULL')
    families.map { |family| family if family.drop_location == location }.compact
  end

  def self.not_adopted_big_families(drive)
    families = Drive.find(drive).families.where('adopted_by IS NULL')
    families.map { |family| family if family.family_members.length > 4 }.compact
  end

  def members_names_sentence
    names = self.family_members.map { |member| member.first_name }
    names.to_sentence
  end

  def sampled_needs(total_needs)
    need_objects = self.family_members.map { |person| person.needs }
    need_strings = []
    need_objects.each { |x| x.each { |y| need_strings << y.text } }
    need_strings.sample(total_needs)
  end

end
