class FamilyMembersController < ApplicationController
  before_filter :validate_organizer, except: [:new, :create]
  before_filter :validate_organizer_with_family, only: [:new, :create]

  def new
    @family = Family.find(params[:family_id])
    @family_member = @family.family_members.new
  end

  def create
    if @family_member = FamilyMember.new(params[:family_member])
      @family_member.family = Family.find(params[:family_id])
      @family_member.save
      redirect_to family_path(params[:family_id])
    else
      flash[:alert] = "That didn't work out quite right"
    end
  end

  def edit
    @family_member = FamilyMember.find(params[:id])
  end

  def update
    @family_member = FamilyMember.find(params[:id])
    if @family_member.update_attributes(params[:family_member])
      redirect_to family_path(@family_member.family_id)
    else
      flash[:alert] = "That didn't work out quite right"
    end
  end

  protected

  def validate_organizer
    drive = FamilyMember.find(params[:id]).family.drive
    redirect_to root_url unless organizer?(drive)
  end

  def validate_organizer_with_family
    drive = Family.find(params[:family_id]).drive
    redirect_to root_url unless organizer?(drive)
  end
end
