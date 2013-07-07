class UserMailer < ActionMailer::Base
  default from: "lillie.chilen@gmail.com"

  def adopted_family(user)
    @user = user
    @url  = 'http://example.com/login'
    mail(to: @user.email, subject: 'Thank you from Giftdriver')
  end
end