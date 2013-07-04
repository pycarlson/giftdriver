class FamilyMember < ActiveRecord::Base
  attr_accessible :first_name, :age, :gender, :size_pants, :size_shirt, :size_dress, :size_shoes, :bio

  belongs_to :family
  has_many :needs
end