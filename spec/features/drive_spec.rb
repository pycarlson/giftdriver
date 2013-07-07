require 'spec_helper'

describe "Creating and managing a drive" do 
  let(:user) { create :user }

  before do
    login(user)
  end

  describe "Managing a drive" do

    it "lets a user create a drive" do
      visit root_path

      click_link "Create a Drive"

      fill_in "drive[org_name]", with: "Cats for Cats"
      fill_in "drive[org_blurb]", with: "We help people get cats fun treats!"
      fill_in "drive[org_email]", with: "cat@mittens.cat"
      fill_in "drive[org_phone]", with: "555-555-5555"
      fill_in "drive[org_address]", with: "1251 Address Road"
      fill_in "drive[org_zipcode]", with: "83743"
      fill_in "drive[drive_title]", with: "Mittens for Kittens"
      fill_in "drive[drive_blurb]", with: "This is a mitten drive for kittens"
      fill_in "drive[drop_location]", with: "City Hall"
      fill_in "drive[start_date]", with: "Jan 5, 2017"
      fill_in "drive[end_date]", with: "Jan 5, 2018"

      click_button "Create Drive"

      within ".drive-deets" do
        expect(page).to have_content "Cats for Cats"
      end
    end

    context "when a drive exists" do
      let(:drive) { create :drive }

      before do
        drive.users << user
      end

      it "lets the drive organizer update drive details" do
        visit drive_path(drive)
        expect(page).to have_content "Edit Drive Details"
      end

      it "lets the drive organizer log gift statuses"

    end
  end

  describe "Adding family data to the drive" do
    it "lets the drive organizer add a family via form"
    it "lets the drive organizer add a family member via form"
    it "lets the drive organizer add a need via form"
    it "lets the drive organizer import family data via CSV"
  end


end