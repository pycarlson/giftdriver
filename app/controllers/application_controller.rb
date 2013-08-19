class ApplicationController < ActionController::Base
  protect_from_forgery
  Devise::Controllers::Helpers
  before_filter :authenticate_user! 

  def after_sign_in_path_for(user)
    drives_path
  end

  def organizer?(drive)
    access = Organizer.where("user_id = ? AND drive_id = ?", current_user.id, drive.id).first
    true unless access.nil?
  end

  def sole_location?(drive)
    true if drive.drop_locations.length == 1
  end
  
  helper_method :organizer?
  helper_method :sole_location?
end
