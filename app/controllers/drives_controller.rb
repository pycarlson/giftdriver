class DrivesController < ApplicationController

  skip_before_filter :authenticate_user!, :only => [:index, :show]
  before_filter :validate_organizer, except: [:index, :show, :new, :create]

  def index
    @drives = Drive.all
  end

  def show
    @drive = Drive.find(params[:id])
    @families = @drive.families
    @not_adopted = Family.not_adopted_families(@drive).sample(5)
    @family = Family.new
    @organizers = Organizer.where("drive_id = ?", @drive.id)
    @drop_location = DropLocation.where("drive_id = ?", @drive.id)
    # @json = @drop_location.to_gmaps4rails
    @donor_ids = []
    @drive.donors.each { |donor| @donor_ids << donor.user_id }
  end

  def new
    @drive = Drive.new
    @drop_location = DropLocation.new
  end

  def create
    @drive = Drive.new()
    @drive.org_name = params[:org_name]
    @drive.org_blurb = params[:org_blurb]
    @drive.org_email = params[:org_email]
    @drive.org_phone = params[:org_phone]
    @drive.org_address = params[:org_address]
    @drive.org_zipcode = params[:org_zipcode]
    @drive.drive_title = params[:drive_title]
    @drive.drive_blurb = params[:drive_blurb]
    @drive.start_date = params[:start_date]
    @drive.end_date = params[:end_date]
    @drive.save

    if @drive.save
      location = DropLocation.new
      location.street = params[:street]
      location.city = params[:city]
      location.state = params[:state]
      location.zipcode = params[:zipcode]
      location.code = params[:code]
      location.drive_id = @drive.id
      location.save
      @drive.drop_locations << location
      @drive.users << current_user
      organizer = Organizer.where("user_id = ? AND drive_id = ?", current_user.id, @drive.id).first
      organizer.save
      @drive.save
      redirect_to drive_path(@drive)
    else
      flash.now[:error] = @drive.errors.full_messages
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
      flash.now[:error] = @drive.errors.full_messages
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
      redirect_to drive_path
    else
      flash[:alert] = "There was a problem saving the drop location! Please verify the address and try again."
      redirect_to drive_path
    end
  end

  protected

  def validate_organizer
    redirect_to root_url unless organizer?(Drive.find(params[:id]))
  end

end
