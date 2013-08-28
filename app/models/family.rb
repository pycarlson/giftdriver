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

  # def update_adoptor_drop_date(id, user_id)
  #   donor = Donor.where(:user_id => user_id, :drive_id => self.drive_id)
  #   p "*" * 100
  #   p donor
  #   donor.drop_date_id = id
  #   donor.save
  # end

  # def get_adopter_drop_date
  #   id = User.find(self.user_id).donors.first.drop_date_id
  #   DropDate.find(id).date_and_time
  # end

  def self.not_adopted_families(drive)
    Drive.find(drive).families.where('adopted_by IS NULL')
  end

  def self.adopted_families(drive)
    Drive.find(drive).families.where('adopted_by IS NOT NULL')
  end

  def self.not_adopted_families_by_size(drive, family_size)
    all_families = Drive.find(drive).families.where('adopted_by IS NULL')
    if family_size == "0"
      filtered_families = all_families
    elsif family_size == "5"
      all_families = Drive.find(drive).families.where('adopted_by IS NULL')
      filtered_families = all_families.map do |fam| 
        fam if fam.family_members.length > 4
      end
    else
      filtered_families = all_families.map do |fam|
        fam if fam.family_members.length == family_size.to_i
      end
    end
    filtered_families.compact
  end

  def self.not_adopted_families_by_location_and_size(drive, location, family_size)
    all_families = Drive.find(drive).families.where('adopted_by IS NULL')
    filtered_families = all_families.map do |fam| 
      fam if fam.family_members.length == family_size && fam.drop_location == location 
    end
    filtered_families.compact
  end

  def self.not_adopted_families_by_location(drive, location)
    all_families = Drive.find(drive).families.where('adopted_by IS NULL')
    all_families.map { |fam| fam if fam.drop_location == location }.compact
  end

  def self.not_adopted_big_families_by_location(drive, location)
    all_families = Drive.find(drive).families.where('adopted_by IS NULL')
    filtered_families = all_families.map do |fam| 
      fam if fam.family_members.length > 4 && fam.drop_location == location 
    end
    filtered_families.compact
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
