class NeedsController < ApplicationController
  def new
    @member = FamilyMember.find(params[:family_member_id])
    @need = Need.new
  end

  def create
    family_member = FamilyMember.find(params[:family_member_id])
    @need = Need.new(params[:need])
    if @need.save
      family_member.needs << @need
      redirect_to family_path(family_member.family_id)
    else
    end
  end
end