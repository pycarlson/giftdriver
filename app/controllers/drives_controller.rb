class DrivesController < ApplicationController

  skip_before_filter :authenticate_user!, :only => [:index, :show]
  before_filter :validate_organizer, except: [:index, :show, :new, :create]
  before_filter :load_drive, :only => [:show, :edit, :update, :manage, :add_organizer]

  def index
    @drives = Drive.all
  end

  def show
    @families = @drive.families
    @not_adopted = @drive.not_adopted_families.sample(5)
    @family = Family.new
    @organizers = @drive.users
    # @json = @drop_location.to_gmaps4rails
    @locations = @drive.drop_locations
  end

  def new
    @drive = Drive.new
    @drive.drop_locations.build
  end

  def create
    @drive = current_user.drives.build params[:drive]
    if @drive.save
      redirect_to @drive
    else
      render :new
    end
  end

  def edit
  end

  def update
    if @drive.update_attributes(params[:drive])
      redirect_to drive_path(@drive)
    else
      render :edit
    end
  end

  def manage
    @families = @drive.families.order(:id)
  end

  def add_organizer
    user = User.find_by_email(params[:email])
    if user.nil?
      flash[:alert] = "Please have user sign up."
      redirect_to drive_path
    else
      unless @drive.organizer?(user)
        @drive.users << user
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

  def load_drive
    @drive = Drive.find(params[:id])
  end

end
