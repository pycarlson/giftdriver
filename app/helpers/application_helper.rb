module ApplicationHelper

  def last_organizer?(drive)
    Organizer.where('drive_id = ?', drive.id).count < 2 
  end

end
