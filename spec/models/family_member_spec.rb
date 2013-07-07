require 'spec_helper'

describe FamilyMember do

  it "can be created from a factory" do
    family_member = create :family_member
    expect(family_member.id).not_to be_nil
  end

  context "family member validations and associations" do
    it { should validate_presence_of :first_name}
    it { should validate_presence_of :age}
    it { should validate_presence_of :gender}
    it { should validate_presence_of :bio}
    it { should belong_to(:family) }
    it { should have_many(:needs) }
  end
end
