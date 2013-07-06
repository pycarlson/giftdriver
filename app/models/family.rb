class Family < ActiveRecord::Base
  has_many :family_members
  validates :code, :presence => :true
  belongs_to :drive
  attr_accessible :code

  def adopted?
    self.adopted_by != nil
  end

  def self.not_adopted_families(drive)
    Drive.find(drive).families.where('adopted_by IS NULL')
  end

  def self.adopted_families(drive)
    Drive.find(drive).families.where('adopted_by IS NOT NULL')
  end

  def members_names_sentence
    names = self.family_members.map { |member| member.first_name }
    names.to_sentence
  end

  def sampled_needs(total_needs)
    need_objects = self.family_members.map { |person| person.needs }
    need_strings = need_objects.map { |x| x[0].text }
    need_strings.sample(total_needs)
  end

end
