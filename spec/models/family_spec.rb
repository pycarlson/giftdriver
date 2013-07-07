require 'spec_helper'

describe Family do

  it "can be created from a factory" do
    family = create :family
    expect(family.id).not_to be_nil
  end

  context "family associations" do
    it { should validate_presence_of :code}
    it { should have_many(:family_members) }
    it { should belong_to(:drive) }
  end
end
