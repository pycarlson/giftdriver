class FamiliesController < ApplicationController

  def index
    @families = Family.all
  end

  def new
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