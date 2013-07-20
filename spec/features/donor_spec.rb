require 'spec_helper'

describe 'Adopting a family' do

  describe 'Browsing the drive' do
    it 'lets the user view the drive page'
    it 'does not show the user the organizer console'

    describe 'Browsing families in a drive' do

      context 'when a user is not logged in' do
        it 'does not let the view see the family show page'
      end

      context 'when a user is logged in' do

        context 'when a drive has mutiple locations' do
          it 'prompts the user for their location preference'
          it 'shows families based on user location preference'
          it 'shows famlies divided by adopted / not-adopted status'
        end

        context 'when a drive has a single location' do
          it 'does not prompt the user for their location preference'
          it 'shows all families'
        end
      end

      describe 'Adopting a family' do
        it 'allows user to view an individual family page'
        it 'allows user to adopt a family'
        it 'sends a confirmation email when the family is adopted'
        it 'displays that the family is adopted'
        it 'does not allow the family to be adopted again'
      end
    end
  end
end