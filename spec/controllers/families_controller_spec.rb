require 'spec_helper'

describe FamiliesController do

	let(:family) { FactoryGirl.create(:family) }
	let(:drive) { FactoryGirl.create(:drive) }
	let(:drop_location) { FactoryGirl.create(:drop_locatiion) }
	let(:family_attributes) { FactoryGirl.create(:family) }

	before do
		drive
	end

	context "with valid attributes" do
		it "creates a new drop location" do
			family_attributes[:drive_id] = drive.id

			expect {
				post :create, family: family_attributes
			}.to change(Family, :count).by(1)
		end
	end
end