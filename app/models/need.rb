class Need < ActiveRecord::Base
  attr_accessible :text, :priority
  validates :text, :family_member_id, :presence => :true 
  belongs_to :family_member
end
