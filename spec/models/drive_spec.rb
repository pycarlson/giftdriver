require 'spec_helper'

describe Drive do

  let(:user) { FactoryGirl.build(:user) }
  let(:drive) { FactoryGirl.build(:drive) }

  context "all the associations" do
    it { should validate_presence_of :org_blurb}
    it { should validate_presence_of :org_email}
    it { should validate_presence_of :org_phone}
    it { should validate_presence_of :org_name}
    it { should validate_presence_of :org_address}
    it { should validate_presence_of :org_zipcode}
    it { should validate_presence_of :drop_location}
    it { should validate_presence_of :drive_title}
    it { should validate_presence_of :drive_blurb}
    it { should validate_presence_of :start_date}
    it { should validate_presence_of :end_date}
    it { should validate_uniqueness_of :drive_title}
  end
end
