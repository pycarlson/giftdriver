class Donor < ActiveRecord::Base
  belongs_to :drive
  belongs_to :user
  belongs_to :drop_location
  

  attr_accessible :drop_location

  validates :drive_id, uniqueness: { scope: :user_id }
  
end