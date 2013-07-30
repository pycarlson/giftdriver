class FamiliesController < ApplicationController

  before_filter :validate_organizer, except: [:index, :show, :adopt, :update, :update_gift_status]
  before_filter :find_family, except: [:index, :create]

  def filter
    "This is a message from families#filter"
  end

  def index
    @drive = Drive.find(params[:drive_id])

    if @drive.drop_locations.length <= 1 || organizer?(@drive)
      @filtered_families = Family.where(drive_id: params[:drive_id])
    elsif @drive.user_has_dropoff_preference?(current_user)
      donor_pref = @drive.donor_dropoff_pref(current_user)
      @filtered_families = Family.where(drive_id: params[:drive_id], drop_location_id: donor_pref)  
    else
      redirect_to new_drive_donor_path(@drive)
    end

    if !@filtered_families.nil?
      @not_adopted = @filtered_families.where('adopted_by IS NULL').paginate(:page => params[:page], :per_page => 6)

      @adopted = @filtered_families.where('adopted_by IS NOT NULL')
    end
  end

  def create
    @family = Family.new
    drive = Drive.find(params[:drive_id])
    @family.drive = drive
    @family.code = params[:family][:code]
    @family.save
    
    if sole_location?(drive) == true
      location = DropLocation.find_by_drive_id(drive.id)
    else
      location = DropLocation.find(params[:family][:drop_location_id])
    end
    @family.drop_location = location
 
    if @family.save
      redirect_to family_path(@family)
    else
      flash[:alert] = "That didn't work out quite right"
      render 
    end
  end

  def show
    @drive = Drive.find(@family.drive_id)
  end

  def update
    drive = Drive.find(@family.drive_id)
    @family.update_attributes(:num_boxes => params[:family][:num_boxes])
    redirect_to manage_path(drive.id)
  end

  def update_gift_status
    drive = Drive.find(@family.drive_id)
    @family.update_attribute(params[:status], true)
    redirect_to manage_path(drive.id)
  end

  def adopt
    if @family.save
      @family.update_attribute(:adopted_by, current_user.id)
      @family.update_attribute(:user_id, current_user.id)
      p "*" * 100
      current_user.update_attributes(params[:family][:users])
      flash[:message] = "THANK YOU!"
      UserMailer.adopted_family(current_user, @family.id).deliver
      redirect_to family_path(@family.id)
    else
      flash[:alert] = "Something went wrong. Try again?"
      redirect_to family_path(@family.id)
    end
  end

  protected

  def validate_organizer
    redirect_to root_url unless organizer?(Drive.find(params[:drive_id]))
  end

  def find_family
    @family = Family.find(params[:id])
  end


end
