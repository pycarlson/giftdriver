class Family < ActiveRecord::Base
  has_many :family_members
  validates :code, :presence => :true
  belongs_to :drive

   def adopted?
    self.adopted_by != nil
  end
end
