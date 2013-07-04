class FamilyMembersController < ApplicationController
  def new
    @family_id = params[:family_id]
    @family_member = FamilyMember.new
  end
end