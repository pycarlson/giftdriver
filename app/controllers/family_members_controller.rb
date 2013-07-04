class FamilyMembersController < ApplicationController
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
end