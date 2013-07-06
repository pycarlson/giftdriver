class FamilyMemberImportsController < ApplicationController
  def new
    @family_member_import = FamilyMemberImport.new
  end

  def create
    @family_member_import = FamilyMemberImport.new(params[:family_member_import])

    if @family_member_import.save
      redirect_to root_path, notice: "Families imported successfully."
    else
      render :new
    end
  end
end
