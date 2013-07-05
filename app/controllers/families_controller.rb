class FamiliesController < ApplicationController

  def index
    @families = Family.where('drive_id = ?', params[:drive_id])
  end

  def new
    @drive = params[:drive_id]
    @family = Family.new
  end

  def create
    if @family = Family.create
      redirect_to family_path(@family.id)
    else
      flash[:alert] = "That didn't work out quite right"
    end
  end

  def show
    @family = Family.find(params[:id])
  end

end
