class User < ActiveRecord::Base
  has_many :organizers
  has_many :drives, through: :organizers
  has_many :donors
  has_many :drive_donors, :through => :donors, :source => :drive
  has_many :drop_locations, :through => :donors
  has_many :families

  # Include default devise modules. Others available are:
  # :token_authenticatable, :confirmable,
  # :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
  :recoverable, :rememberable, :trackable, :validatable

  # Setup accessible (or protected) attributes for your model
  attr_accessible :email, :password, :password_confirmation, :remember_me, :full_name, :street, :city, :state, :zipcode, :phone, :company
  # attr_accessible :title, :body

  validates :full_name, :presence => :true

  
end
