require 'spec_helper'

describe FamilyMember do

  let(:Family) { FactoryGirl.build(:family) }
  let(:family_member) { FactoryGirl.build(:family_member) }

  context "family member validations and associations" do
    it { should validate_presence_of :first_name}
    it { should validate_presence_of :age}
    it { should validate_presence_of :gender}
    it { should validate_presence_of :bio}
    it { should belong_to(:family) }
    it { should have_many(:needs) }
  end
end
