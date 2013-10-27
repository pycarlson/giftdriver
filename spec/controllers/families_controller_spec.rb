require 'spec_helper'

describe FamiliesController do
  let(:user) { create(:user) }
  let(:drive) { create(:drive) }

  before do
    sign_in user
    drive.users << user
  end

	context "with valid attributes" do
		it "creates a new family" do
			expect {
				post :create, drive_id: drive.id, family: attributes_for(:family, drive: drive)
			}.to change(Family, :count).by(1)
		end
	end
end
