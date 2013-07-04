class Family < ActiveRecord::Base
  # belongs_to :drive
  has_many :family_members
end