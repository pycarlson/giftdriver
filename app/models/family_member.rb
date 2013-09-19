class FamilyMember < ActiveRecord::Base
  attr_accessible :first_name, :age, :gender, :size_pants, :size_shirt, :size_dress, :size_shoes, :bio, :needs_attributes

  validates :first_name, :age, :gender, :bio, :presence => :true

  belongs_to :family
  has_many :needs, :dependent => :destroy, :inverse_of => :family_member

  accepts_nested_attributes_for :needs, :allow_destroy => true

end
