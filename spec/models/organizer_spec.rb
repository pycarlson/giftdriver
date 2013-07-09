require 'spec_helper'

describe Organizer do

  it "can be created from a factory" do
    organizer = create :organizer
    expect(organizer.id).not_to be_nil
  end

  context "organizer associations" do
    it { should belong_to(:drive) }
    it { should belong_to(:user) }
  end
end