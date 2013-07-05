class Family < ActiveRecord::Base
  # belongs_to :drive
  has_many :family_members
  belongs_to :drive
end
