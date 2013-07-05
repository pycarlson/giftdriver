require 'spec_helper'

describe Family do

  let(:family) { build(:family) }

  context "family associations" do
    it { should validate_presence_of :code}
    it { should have_many(:family_members) }
    it { should belong_to(:drive) }
  end
end
