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

  def destroy
  end

end
