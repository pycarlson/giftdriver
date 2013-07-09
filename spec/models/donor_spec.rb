require 'spec_helper'

describe Donor do

  it "can be created from a factory" do
    donor = create :donor
    expect(donor.id).not_to be_nil
  end

  context "donor associations" do
    it { should belong_to(:drive) }
    it { should belong_to(:drop_location) }
    it { should belong_to(:user) }
  end
end