class DonorsController < ApplicationController
  before_filter :load_resources, except: [:create]

  def new
    @donor = Donor.new
  end

  def create
    donor = Donor.new
    donor.drive_id = params[:drive_id]
    donor.user_id = current_user.id
    donor.drop_location_id = params[:donor][:drop_location]
    donor.save
    redirect_to drive_families_path(params[:drive_id])
  end

  def edit
    @donor = @drive.donor(current_user)
  end

  def update
    @donor = @drive.donor(current_user)
    @donor.drop_location = DropLocation.find(params[:donor][:drop_location])

    if @donor.save
      redirect_to drive_path(params[:drive_id])
    else
      render action: "edit"
    end
  end
end

private

  def load_resources
    @drive = Drive.find(params[:drive_id])
    @locations = @drive.drop_locations
    @json = @locations.to_gmaps4rails
  end