class DropLocation < ActiveRecord::Base

  include Gmaps4rails::ActsAsGmappable

  belongs_to :drive
  has_many :families
  has_many :donors
  has_many :users, :through => :donors

  validates :street, :city, :state, 
            :zipcode, :code, :presence => :true
  

  acts_as_gmappable
  geocoded_by :gmaps4rails_address 
  after_validation :geocode    

  attr_accessible :street, :city, :state, :zipcode, :code 

  def gmaps4rails_address
     "#{self.street}, #{self.city}, #{self.state}, #{self.zipcode}"  
  end
end
