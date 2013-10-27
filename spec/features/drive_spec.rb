require 'spec_helper'

describe "Creating and managing a drive" do 
  let(:user) { create :user }

  before do
    login(user)
  end

  describe "Managing a drive" do

    it "lets a user create a drive" do
      visit root_path

      click_link "CREATE A DRIVE"

      fill_in "drive[org_name]", with: "Cats for Cats"
      fill_in "drive[org_blurb]", with: "We help people get cats fun treats!"
      fill_in "drive[org_email]", with: "cat@mittens.cat"
      fill_in "drive[org_phone]", with: "555-555-5555"
      fill_in "drive[org_address]", with: "1251 Address Road"
      fill_in "drive[drive_title]", with: "Mittens for Kittens"
      fill_in "drive[drive_blurb]", with: "This is a mitten drive for kittens"
      fill_in "drive[start_date]", with: "Jan 5, 2017"
      fill_in "drive[end_date]", with: "Jan 5, 2018"
      fill_in "drive[drop_locations_attributes][0][street]", with: "111 California St"
      fill_in "drive[drop_locations_attributes][0][city]", with: "San Francisco"
      fill_in "drive[drop_locations_attributes][0][state]", with: "CA"
      fill_in "drive[drop_locations_attributes][0][zipcode]", with: "94102"
      fill_in "drive[drop_locations_attributes][0][code]", with: "Placetown"

      click_button "Create Drive"

      within ".title" do
        expect(page).to have_content "Cats for Cats"
      end
    end

    context "when a drive exists" do
      let(:drive) { create :drive }
      let(:adopted_family) { create :adopted_family, drive: drive }
      let(:family_member) { create :family_member, family: adopted_family }

      before do
        drive.users << user
      end

      it "lets the organizer update drive details" do
        visit drive_path(drive)
        click_link  "Edit Drive Details"

        fill_in "drive[org_name]", with: "Cats for Kittens"
        click_button "Update Drive"

        within ".drive-deets" do
          expect(page).to have_content "Cats for Kittens"
        end
      end

      describe "managing organizers" do
        let(:second_organizer) { create :user, email: "org2@cat.cat" }

        it "lets the organizer make other users organizers" do
          visit drive_path(drive)

          within ".add-organizer" do
            fill_in "email", with: second_organizer.email
            click_button "Add Organizer"
          end

          expect(page).to have_content "org2@cat.cat"
        end

        it "doesn't let the organizer make non-users organizers"
      end

      context "when the drive has multiple locations" do
        it "allows organizer to see all families without location filtering"
        it "does not prompt organizer for location preference"
        it "allows organizer to associate a family with a location by name"
        it "allows organizer to edit drop locations"
      end

      it "lets the organizer add more drop locations"

      describe "when there are many families in the drive" do
        before do
          @family_with_one = create(:family, drive: drive)
          create(:family_member, family: @family_with_one, first_name: 'Onefamily')

          @family_with_two = create(:family, drive: drive)
          create(:family_member, family: @family_with_two, first_name: 'Twofamily')
          create(:family_member, family: @family_with_two)
        end

        it "lets a user browse families to adopt", js: true do
          visit drive_families_path(drive)

          expect(page).to have_content('Onefamily')
          expect(page).to have_content('Twofamily')

          find('#filter_1').click
          expect(page).to have_content('Onefamily')
          expect(page).not_to have_content('Twofamily')

          find('#filter_2').click
          expect(page).not_to have_content('Onefamily')
          expect(page).to have_content('Twofamily')
        end
      end

      context "when a family has been adopted" do

        # These tests are broken because a <form> is not allowed to span multiple table elements.
        # We would need to pick a different strategy for the gift management page if we want
        # to be able to test it.
        it "lets the organizer log gifts as received by organization" do
          visit manage_path(adopted_family)

          within '#manage_table tbody tr:first' do
            find("[name=received_at_org]").set("Oct 2, 2001")
            click_on "Update"
          end

          visit manage_path(adopted_family)
          expect(page).to have_content("Oct 2, 2001")
        end

        it "lets the organizer log gift as delivered/given to families" do
          visit manage_path(adopted_family)

          click_link "Received"
          click_link "Delivered"
          within ".delivered" do
            expect(page).to have_content(Time.now.strftime("%B %-d, %Y"))
          end
        end
      end

      describe "Adding family data to the drive" do
        it "lets the organizer add a family via form" do
          visit drive_path(drive)

          fill_in "family[code]", with: "123abc"
          click_button "Add Family"

          expect(page).to have_content "Adopt this Family"
        end

        it "lets the organizer add a family member via form" do
          visit new_family_family_member_path(adopted_family)

          fill_in "family_member[first_name]", with: "Aureliano"
          fill_in "family_member[age]", with: "235"
          fill_in "family_member[gender]", with: "male"
          fill_in "family_member[bio]", with: "I'm a character in a book."
          fill_in "family_member[needs_attributes][0][text]", with: "Hot jams"
          click_button "Create Family member"

          expect(page).to have_content "Hot jams"
        end

        it "lets the organizer add additional needs via edit form", js: true do
          visit edit_family_member_path(family_member)

          click_link "Add a need"
          find(:css, "#right-member-create input[type=text]").set("New Shirts")

          click_link "Add a need"

          need_inputs = all(:css, "#right-member-create input[type=text]")
          need_inputs.last.set("New Hats")

          click_button "Update Family member"

          expect(page).to have_content "New Hats"
        end

        it "lets the organizer import family data via CSV"
        it "lets the organizer import family data via XLS"
      end
    end
  end
end
