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
    @organizers = UsersWithAccess.where("drive_id = ?", @drive.id)
  end

  def new
    @drive = Drive.new
  end

  def create
    @drive = Drive.new(params[:drive])

    if @drive.save
      @drive.users << current_user
      organizer = UsersWithAccess.where("user_id = ? AND drive_id = ?", current_user.id, @drive.id).first
      organizer.organizer = true
      organizer.save
      redirect_to drive_path(@drive)
    else
      render :edit
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

  def destroy
  end

  def access
    user = User.find_by_email(params[:email])

    if user == nil
      flash[:alert] = "Please have user sign up."
      redirect_to drive_path
    else
      access = UsersWithAccess.where("user_id = ? AND drive_id = ?", user.id, params[:id])
      if access.empty?
        new_organizer = UsersWithAccess.new
        new_organizer.user_id = user.id
        new_organizer.drive_id = params[:id]
        new_organizer.organizer = true
        new_organizer.save
        flash[:alert] = "User is now an organizer for this drive."
        redirect_to drive_path
      else
        flash[:alert] = "User is already an organizer for this drive."
        redirect_to drive_path
      end
    end
  end

  def delete_organizer
    organizer = UsersWithAccess.where("user_id = ? AND drive_id = ?", params[:user_id], params[:id]).first.id
    UsersWithAccess.delete(organizer)
    redirect_to drive_path
  end

  protected

  def validate_organizer
    redirect_to root_url unless organizer?(Drive.find(params[:id]))
  end

end
