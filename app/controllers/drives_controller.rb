class DrivesController < ApplicationController

  def index
    @drives = Drive.all
  end

  def show
    @drive = Drive.find_by_title(params[:title])
  end

  def new
    @drive = Drive.new
  end

  def create
    Drive.create(params[:drive], user_id: current_user.id)
  end

  def edit
  end

  def update
  end

  def destroy
  end

end
