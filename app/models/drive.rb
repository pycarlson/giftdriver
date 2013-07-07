class Drive < ActiveRecord::Base

  include Gmaps4rails::ActsAsGmappable

  has_many :organizers
  has_many :users, :through => :organizers
  has_many :families

  attr_accessible :org_blurb,
                  :org_email,
                  :org_phone,
                  :org_name,
                  :org_address,
                  :org_zipcode,
                  :drop_location,
                  :drive_title,
                  :drive_blurb,
                  :start_date,
                  :end_date

  validates :org_blurb,
            :org_email,
            :org_phone,
            :org_name,
            :org_address,
            :org_zipcode,
            :drop_location,
            :drive_title,
            :drive_blurb,
            :start_date,
            :end_date, presence: true

  validates :drive_title, :uniqueness => :true

  acts_as_gmappable
  geocoded_by :gmaps4rails_address 
  after_validation :geocode      

  def gmaps4rails_address
  #describe how to retrieve the address from your model, if you use directly a db column, you can dry your code, see wiki
     "#{self.drop_location}"  
  end
end
