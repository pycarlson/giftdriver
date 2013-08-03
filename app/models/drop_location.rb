class DropLocation < ActiveRecord::Base

  include Gmaps4rails::ActsAsGmappable

  belongs_to :drive
  has_many :families
  has_many :donors
  has_many :users, :through => :donors
  has_many :drop_dates
  accepts_nested_attributes_for :drop_dates, :allow_destroy => true


  validates :street, :city, :state, 
            :zipcode, :code, :presence => :true
  
  acts_as_gmappable(process_geocoding: !Rails.env.test?)
  geocoded_by :gmaps4rails_address 
  
  after_validation :geocode    

  attr_accessible :street, :city, :state, :zipcode, :code, :drop_dates_attributes 

  def gmaps4rails_address
     "#{self.street}, #{self.city}, #{self.state}, #{self.zipcode}"  
  end
end
