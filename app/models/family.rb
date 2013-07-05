class Family < ActiveRecord::Base
  has_many :family_members
  belongs_to :drive
end
