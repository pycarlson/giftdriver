class NeedsController < ApplicationController
  def new
    p params
    @member = FamilyMember.find(params[:family_member_id])
    @need = Need.new
  end

  def create
    p params
    family_member = FamilyMember.find(params[:family_member_id])
    if @need = Need.new(params[:need])
      @need.save
      family_member.needs << @need
      redirect_to family_path(family_member.family_id)
    else
    end
  end
end