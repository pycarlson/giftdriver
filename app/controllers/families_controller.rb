class FamiliesController < ApplicationController

  def index
    @families = Family.where('drive_id = ?', params[:drive_id])
  end

  def create
    @family = Family.new
    @family.drive = Drive.find(params[:drive_id])
    if @family.save
      redirect_to family_path(@family.id)
    else
      flash[:alert] = "That didn't work out quite right"
    end
  end

  def show
    @family = Family.find(params[:id])
  end

end
