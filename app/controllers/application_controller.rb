class ApplicationController < ActionController::Base
  protect_from_forgery

  before_filter :authenticate_user!

  def after_sign_in_path_for(user)
    drives_path
  end

  def organizer?(drive)
    drive.organizer?(current_user)
  end

  def sole_location?(drive)
    drive.drop_locations.length == 1
  end

  helper_method :organizer?
  helper_method :sole_location?
end
