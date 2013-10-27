class FamilyMemberImportsController < ApplicationController
  def index
    respond_to do |format|
      format.html
      format.xls
      format.xlxs
    end
  end

  def new
    @drive = Drive.find(params[:drive_id])
    @family_members = FamilyMemberImport.new
  end

  def create
    @drive = Drive.find(params[:drive_id])
    @family_members = FamilyMemberImport.new(params[:family_member_import], params[:drive_id])
    
    if @family_members.save
      redirect_to drive_path(@drive), notice: "Families imported successfully."
    else
      render :new
    end
  end
end
