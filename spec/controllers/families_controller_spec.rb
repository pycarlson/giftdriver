require 'spec_helper'

describe FamiliesController do

	let(:family) { create(:family) }
	let(:drive) { create(:drive) }
	let(:drop_location) { create(:drop_locatiion) }
	let(:family_attributes) { create(:family) }

	before do
		drive
	end

	context "with valid attributes" do
		it "creates a new family" do
			family_attributes[:drive_id] = drive.id

			expect {
				post :create, family: family_attributes
			}.to change(Family, :count).by(1)
		end
	end
end