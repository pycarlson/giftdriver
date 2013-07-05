class DrivesController < ApplicationController

  def index
    @drives = Drive.all
  end

  def show
    @drive = Drive.find(params[:id])
    @families = @drive.families
  end

  def new
    @drive = Drive.new
  end

  def create
    @drive = Drive.new(params[:drive], user_id: current_user.id)
    if @drive.save
      redirect_to drive_path(@drive)
    else
    end
  end

  def edit
    @drive = Drive.find(params[:id])
  end

  def update
  end

  def destroy
  end

end
