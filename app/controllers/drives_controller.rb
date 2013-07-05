class DrivesController < ApplicationController

  def index
    @drives = Drive.all
  end

  def show
    p params
    @drive = Drive.find(params[:id])
    @families = @drive.families
  end

  def new
    @drive = Drive.new
  end

  def create
    Drive.create(params[:drive], user_id: current_user.id)
  end

  def edit
    @drive = Drive.find(params[:id])
  end

  def update
  end

  def destroy
  end

end
