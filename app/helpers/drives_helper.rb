module DrivesHelper
  def get_donation_page_url(id)
    drive = Drive.find(id)
    if drive
      return drive.fundraising_url
    else
      return false
    end
  end

end