class FamilyMemberImportsController < ApplicationController
  def index
    respond_to do |format|
      format.html
      format.xls
    end
  end

  def new
    p "I am getting here!" * 5
    @drive = Drive.find(params[:drive_id])
    p "AND getting here!" * 5
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
