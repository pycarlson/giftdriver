module ApplicationHelper
  def authorized?(drive)    
    current_user.id == drive.user
  end
end
