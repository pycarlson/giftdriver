module ApplicationHelper

  def last_organizer?(drive)
    Organizer.where('drive_id = ?', drive.id).count < 2 
  end

  def sole_location?(drive)
    true if drive.drop_locations.length == 1
  end
end
