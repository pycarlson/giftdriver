class Donor < ActiveRecord::Base
  belongs_to :drive
  belongs_to :user
  belongs_to :drop_location
end