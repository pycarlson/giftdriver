class NeedsController < ApplicationController
  before_filter :validate_organizer

  def new
    @member = FamilyMember.find(params[:family_member_id])
    @need = Need.new
  end

  def create
    @member = FamilyMember.find(params[:family_member_id])
    @need = Need.new(params[:need])
    @member.needs << @need

    if @need.save
      redirect_to family_path(@member.family_id)
    else
      flash.now[:error] = @need.errors.full_messages
      render :new
    end
  end

  protected

  def validate_organizer
    drive = FamilyMember.find(params[:family_member_id]).family.drive
    redirect_to root_url unless organizer?(drive)
  end

end
