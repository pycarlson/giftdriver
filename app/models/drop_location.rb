class DropLocation < ActiveRecord::Base

  include Gmaps4rails::ActsAsGmappable

  belongs_to :drive
  has_many :families
  has_many :donors
  has_many :users, :through => :donors
  

  acts_as_gmappable
  geocoded_by :gmaps4rails_address 
  after_validation :geocode    

  attr_accessible :street, :city, :state, :zipcode, :code 

  def gmaps4rails_address
  #describe how to retrieve the address from your model, if you use directly a db column, you can dry your code, see wiki
     "#{self.street}, #{self.city}, #{self.state}, #{self.zipcode}"  
  end
end
