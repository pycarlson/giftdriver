class Family < ActiveRecord::Base
  has_many :family_members
  validates :code, :presence => :true
  belongs_to :drive
  attr_accessible :code, :drop_location
  belongs_to :drop_location


  attr_accessible :drop_locations_attributes
  accepts_nested_attributes_for :drop_location

  #after_save :send_confirmation_email

  def adopted?
    self.adopted_by.present?
  end

  def not_adopted?
    self.adopted_by.blank?
  end

  def get_adopter_email
    user = User.find(self.adopted_by)
    user.email
  end

  def self.not_adopted_families(drive)
    # query by association
    Drive.find(drive).families.where('adopted_by IS NULL')
  end

  def self.adopted_families(drive)
    # query by association
    Drive.find(drive).families.where('adopted_by IS NOT NULL')
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

  def adopted_by?(user)
    self.adopted_by == user
  end
  def send_confirmation_email
    UserMailer.adopted_family(self.adopted_by, @family.id).deliver if self.adopted_by_changed?
  end

end
