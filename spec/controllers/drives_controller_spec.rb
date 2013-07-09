# require 'spec_helper'

# describe DrivesController do

# 	let(:user)	{ FactoryGirl.create(:user) }
# 	let(:drive) { FactoryGirl.create(:drive) }
# 	let(:drive_attributes) { FactoryGirl.create(:drive) }

# 	before do
# 		user
# 	end

# 	context "with valid attributes" do
# 		it "creates a new drive" do
# 			drive_attributes[:user_id] = user.id

# 			expect {
# 				post :create, drive: drive_attributes
# 			}.to change(Drive, :count).by(1)
# 		end
# 	end
# end