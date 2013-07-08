class DonorsController < ApplicationController
  def new
    @drive = Drive.find(params[:drive_id])
    @locations = @drive.drop_locations
    @donor = Donor.new
  end

  def create
    donor = Donor.new
    donor.drive_id = params[:drive_id]
    donor.user_id = current_user.id
    donor.drop_location_id = params[:donor][:drop_location]
    donor.save
    redirect_to drive_path(params[:drive_id])
  end
end