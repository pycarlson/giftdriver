module ApplicationHelper
  def organizer?(drive)
    access = Organizer.where("user_id = ? AND drive_id = ?", current_user.id, drive.id).first
    true unless access.nil?
    p "THIS IS THE PLACE I WANT TO BE!!!!!"
  end

  def last_organizer?(drive)
    Organizer.where('drive_id = ?', drive.id).count < 2 
  end
end
