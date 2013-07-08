class DonorsController < ApplicationController
  def new
    @drive = Drive.find(params[:drive_id])
    @locations = @drive.drop_locations
    @donor = Donor.new
  end
end