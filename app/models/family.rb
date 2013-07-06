class Family < ActiveRecord::Base
  has_many :family_members
  validates :code, :presence => :true
  belongs_to :drive

  def adopted?
    self.adopted_by != nil
  end

  def self.not_adopted_families(drive)
    Drive.find(drive).families.where('adopted_by IS NULL')
  end

  def self.adopted_families(drive)
    Drive.find(drive).families.where('adopted_by IS NOT NULL')
  end

end
