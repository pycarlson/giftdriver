module ApplicationHelper
  def organizer?(drive)
    current_user == drive.user
  end
end
