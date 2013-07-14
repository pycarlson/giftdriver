class FamilyMembersController < ApplicationController
  
  before_filter :validate_organizer, except: [:new, :create]
  before_filter :validate_organizer_with_family, only: [:new, :create]
  before_filter :find_family, only: [:new, :create]

  def new
    @family_member = @family.family_members.new
    @family_member.needs.build
  end

  def create
    @family_member = FamilyMember.new(params[:family_member])
    
    @family_member.family = @family

    if @family_member.save
      redirect_to family_path(@family)
    else
      flash.now[:error] = @family_member.errors.full_messages
      render :new
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
      flash.now[:error] = @family_member.errors.full_messages
      render :edit
    end
  end

  protected
  def find_family
    @family = Family.find(params[:family_id])
  end

  def validate_organizer
    drive = FamilyMember.find(params[:id]).family.drive
    redirect_to root_url unless organizer?(drive)
  end

  def validate_organizer_with_family
    drive = Family.find(params[:family_id]).drive
    redirect_to root_url unless organizer?(drive)
  end
end
