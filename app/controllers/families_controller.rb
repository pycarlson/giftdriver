class FamiliesController < ApplicationController

  before_filter :validate_organizer, except: [:index, :show, :adopt, :update_gift_status, :update_arrived, :update_given]
  before_filter :find_family, except: [:index, :create]
  def index
    @adopted = Family.adopted_families(params[:drive_id])
    @not_adopted = Family.not_adopted_families(params[:drive_id])
  end

  def create
    @family = Family.new
    @family.drive = Drive.find(params[:drive_id])
    @family.code = params[:family][:code]

    if @family.save
      redirect_to family_path(@family.id)
    else
      flash[:alert] = "That didn't work out quite right"
      redirect_to drive_path(params[:drive_id])
    end
  end

  def show
  end

  def update_gift_status
    drive = Drive.find(@family.drive_id)
    # HEY WE'RE COMMUNICATING DIRECTLY FROM THE PAGE TO THE DB HERE
    # Maybe the best idea? Maybe the worst?
    @family.update_attribute(params[:status], true)
    redirect_to manage_path(drive.id)
  end

  def adopt
    if @family.save
      @family.update_attribute(:adopted_by, current_user.id)
      flash[:message] = "THANK YOU!"
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
