class Need < ActiveRecord::Base
  attr_accessible :text, :priority
  validates :text, :family_member, :presence => :true
  belongs_to :family_member, :inverse_of => :needs
end
