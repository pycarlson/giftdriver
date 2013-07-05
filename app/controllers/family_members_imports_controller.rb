class FamilyMembersImportsController < ApplicationController
  def new
    @family_members_import = FamilyMembersImport.new
  end
end
