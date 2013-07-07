class ApplicationController < ActionController::Base
  protect_from_forgery

  before_filter :authenticate_user! 

  def organizer?(drive)
    access = Organizer.where("user_id = ? AND drive_id = ?", current_user.id, drive.id).first
    true unless access.nil?
  end
end
