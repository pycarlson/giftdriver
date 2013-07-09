class UserMailer < ActionMailer::Base
  default from: "lillie.chilen@gmail.com"

  def adopted_family(user, family_id)
    @user = user
    @url  = 'http://example.com/login'
    @family = Family.find(family_id)
    @drive = Drive.find(@family.drive_id)
    @location = DropLocation.find(@family.drop_location_id) if @family.drop_location_id
    mail(to: @user.email, subject: 'Thank you from Giftdriver')
  end
end