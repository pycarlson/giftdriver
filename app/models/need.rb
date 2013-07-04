class Need < ActiveRecord::Base
  attr_accessible :text, :priority

  belongs_to :family_member
end