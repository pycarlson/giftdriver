require 'spec_helper'

describe Need do

  it "can be created from a factory" do
    need = create :need
    expect(need.id).not_to be_nil
  end

  context "need associations" do
    it { should validate_presence_of :text}
    it { should validate_presence_of :family_member}
    it { should belong_to(:family_member) }
  end
end

