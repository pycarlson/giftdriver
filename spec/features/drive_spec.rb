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
      let(:family) { create :family, drive: drive }
      let(:family_member) { create :family_member, family: family }

      before do
        drive.users << user
      end

      it "lets the drive organizer update drive details" do
        visit drive_path(drive)
        click_link  "Edit Drive Details"

        fill_in "drive[org_name]", with: "Cats for Kittens"
        click_button "Update Drive"

        within ".drive-deets" do
          expect(page).to have_content "Cats for Kittens"
        end
      end

      context "when a family has been adopted" do
        before do
          family.adopted_by = user
        end

        it "lets the drive organizer log gift as received" do
          visit manage_path(family)

          save_and_open_page
          click_link "Received"

          expect(page).to have_content(Time.now.strftime("%Y-%m-%d"))
        end

        it "lets the drive organizer log gift as delivered" do
          visit manage_path(family)

          click_link "Received"
          click_link "Delivered"

          expect(page).to have_content(Time.now.strftime("%Y-%m-%d"))
        end
      end

      describe "Adding family data to the drive" do
        it "lets the drive organizer add a family via form" do
          visit drive_path(drive)

          fill_in "family[code]", with: "123abc"
          click_button "Add a Family"

          expect(page).to have_content "Adopt Family"
        end

        it "lets the drive organizer add a family member via form" do
          visit new_family_family_member_path(family)

          fill_in "family_member[first_name]", with: "Aureliano"
          fill_in "family_member[age]", with: "235"
          fill_in "family_member[gender]", with: "male"
          fill_in "family_member[bio]", with: "I'm a character in a book."
          click_button "Add family member"

          expect(page).to have_content "Edit Aureliano"
        end

        it "lets the drive organizer add a need via form" do
          visit new_family_member_need_path(family_member)

          fill_in "need[text]", with: "New Boots"
          click_button "Add need"

          expect(page).to have_content "New Boots"
        end

        it "lets the drive organizer import family data via CSV"
        it "lets the drive organizer import family data via XLS"
      end
    end
  end
end