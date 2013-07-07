class UsersWithAccess < ActiveRecord::Base
  belongs_to :user
  belongs_to :drive
end
