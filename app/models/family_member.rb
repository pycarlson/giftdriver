class FamilyMember < ActiveRecord::Base
  attr_accessible :first_name, :age, :gender, :size_pants, :size_shirt, :size_dress, :size_shoes, :bio

  belongs_to :family
  has_many :needs

  # def self.to_csv(options = {})
  #   CSV.generate(options) do |csv|
  #     csv << column_names
  #     all.each do |family_member|
  #       csv << family_member.attributes.values_at(*column_names)
  #     end
  #   end
  # end
end
