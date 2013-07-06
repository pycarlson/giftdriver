class DrivesController < ApplicationController

  skip_before_filter :authenticate_user!, :only => [:index, :show]
  before_filter :validate_organizer, except: [:index, :show, :new, :create]

  def index
    @drives = Drive.all
  end

  def show
    @drive = Drive.find(params[:id])
    @families = @drive.families
    @not_adopted = Family.not_adopted_families(@drive).sample(3)
    @family = Family.new
  end

  def new
    @drive = Drive.new
  end

  def create
    @drive = Drive.new(params[:drive])
    @drive.user = current_user
    
    if @drive.save
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
    @families = @drive.families
  end

  def destroy
  end

  protected

  def validate_organizer
    redirect_to root_url unless Drive.find(params[:id]).user_id == current_user.id
  end

end
