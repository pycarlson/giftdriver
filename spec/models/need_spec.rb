require 'spec_helper'

describe Need do

  let(:need) { FactoryGirl.build(:need) }

  context "need associations" do
    it { should validate_presence_of :text}
    it { should validate_presence_of :family_member_id}
    # it { should validate_presence_of :priority}
    it { should belong_to(:family_member) }
  end
end

