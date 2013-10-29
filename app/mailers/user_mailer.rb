class UserMailer < ActionMailer::Base
  
  default from: "pyluftig@gmail.com"
  
  def adopted_family(user, family_id)
    @user = user
    @url  = 'http://example.com/login'
    @family = Family.find(family_id)
    @drive = Drive.find(@family.drive_id)
    p "*" * 100
    p @drive
    p @family
    @location = DropLocation.find(@family.drop_location_id) if @family.drop_location_id
    mail(to: @user.email, from: @drive.org_email, subject: 'Thank you from Giftdriver')
  end

  
end