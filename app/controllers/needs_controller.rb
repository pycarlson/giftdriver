class NeedsController < ApplicationController
  before_filter :validate_organizer

  def new
    @member = FamilyMember.find(params[:family_member_id])
    @need = Need.new
  end

  def create
    family_member = FamilyMember.find(params[:family_member_id])
    need = Need.new(params[:need])
    family_member.needs << need

    if need.save
      redirect_to family_path(family_member.family_id)
    else
      flash[:notice] = "Need didn't save. Sorry!"
      redirect_to family_path(family_member.family_id)
    end
  end

  protected

  def validate_organizer
    drive = FamilyMember.find(params[:family_member_id]).family.drive
    redirect_to root_url unless drive.user == current_user
  end

end
