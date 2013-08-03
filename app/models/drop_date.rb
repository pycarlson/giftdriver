class DropDate < ActiveRecord::Base
  belongs_to :drop_location, :inverse_of => :drop_dates
  belongs_to :drive, :inverse_of => :drop_dates
  attr_accessible :date_and_time
end


