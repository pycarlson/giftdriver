module ApplicationHelper
  def organizer?(drive)
    access = UsersWithAccess.where("user_id = ? AND drive_id = ?", current_user.id, drive.id).first
    p "HERE IS ANOTHER CHECK #{access}"
    if access == nil 
      return false
    elsif
      access.organizer == false
      return false
    else
      access.organizer == true
      return true
    end
  end
end
