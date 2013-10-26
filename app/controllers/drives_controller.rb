class DrivesController < ApplicationController

  skip_before_filter :authenticate_user!, :only => [:index, :show]
  before_filter :validate_organizer, except: [:filter, :index, :show, :new, :create]

  def filter
    drive = Drive.find(params[:id])

    if organizer?(drive)
      @families = Family.not_adopted_families_by_size(drive, params[:filter])
    else
      location = drive.set_location(current_user)
      @families = drive.get_filtered_families(drive, location, params[:filter])
    end

    respond_to do |format|
      format.js
    end
  end

  def index
    @drives = Drive.all
  end

  def show
    redirect_to user_session_path unless current_user
      
    @drive = Drive.find_by_id(params[:id])
    @families = @drive.families
    @not_adopted = Family.not_adopted_families(@drive).sample(5)
    @family = Family.new
    @organizers = Organizer.where("drive_id = ?", @drive.id)
    @donor_ids = []
    @drive.donors.each { |donor| @donor_ids << donor.user_id }
    if current_user
      @user = Donor.find_by_user_id(current_user.id)
    end

    if @drive.user_has_dropoff_preference?(current_user)
      @locations = @drive.donor_dropoff_pref(current_user)
    else
      p "*" * 100
      @locations = DropLocation.where('drive_id = ?', @drive.id)
      p "#{@drive.id}"
      p "THIS S THE LOCATIONS #{@locations.inspect}"
      
    end
    
    @json = @locations.to_gmaps4rails

  end

  def new
    @drive = Drive.new
    @drive.drop_locations.build
  end

  def create
    @drive = Drive.new params[:drive]
    @drive.users << current_user
    if @drive.save
      redirect_to @drive
    else
      render :new
    end
  end

  def edit
    @drive = Drive.find(params[:id])
  end

  def update
    @drive = Drive.find(params[:id])
    if @drive.update_attributes(params[:drive])
      redirect_to drive_path(@drive)
    else
      render :edit
    end
  end

  def manage
    @drive = Drive.find(params[:id])
    @families = @drive.families.order(:id)
  end

  def add_organizer
    user = User.find_by_email(params[:email])
    drive = Drive.find(params[:id])

    if user == nil
      flash[:alert] = "Please have user sign up."
      redirect_to drive_path
    else
      new_organizer = Organizer.where("user_id = ? AND drive_id = ?", user.id, params[:id])
      if new_organizer.empty?
        drive.users << user
        flash[:alert] = "User is now an organizer for this drive."
        redirect_to drive_path
      else
        flash[:alert] = "User is already an organizer for this drive."
        redirect_to drive_path
      end
    end
  end

  def delete_organizer
    organizers = Organizer.where("drive_id = ?", params[:id])

    if organizers.length < 2
      redirect_to drive_path
      flash[:alert] = "The last organizer for this event can't be deleted."
    else
      organizer = Organizer.where("user_id = ? AND drive_id = ?", params[:user_id], params[:id]).first.id
      Organizer.delete(organizer)
      redirect_to drive_path
    end
  end

  def drop_locations
    @location = DropLocation.new
    @location.street = params[:street]
    @location.city = params[:city]
    @location.state = params[:state]
    @location.zipcode = params[:zipcode]
    @location.code = params[:code]
    if @location.save
      Drive.find(params[:id]).drop_locations << @location
      render :json => {location_code: params[:code], location_id: @location.id}.to_json
    else
      render :json => {alert: "There was a problem saving the drop location! Please verify the address and try again."}.to_json
    end
  end

  protected

  def validate_organizer
    redirect_to root_url unless organizer?(Drive.find(params[:id]))
  end

end
