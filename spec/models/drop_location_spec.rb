require 'spec_helper'

describe DropLocation do

  it "can be created from a factory" do
    drop_location = create :drop_location
    expect(drop_location.id).not_to be_nil
  end

  context "all the associations" do
    it { should validate_presence_of :street }
    it { should validate_presence_of :city }
    it { should validate_presence_of :state }
    it { should validate_presence_of :zipcode }
    it { should validate_presence_of :code } 
    # it { should validate_presence_of :latitude } 
    # it { should validate_presence_of :longitude } 
    # it { should validate_presence_of :gmaps } 
    it { should belong_to(:drive) }
    it { should have_many(:families) }
    it { should have_many(:users) }
    it { should have_many(:donors) }
  end
end
