class UserMailer < ActionMailer::Base
  default from: "info@eaters.com"

  def welcome_email(user, password)
    @user = user
    @password  = password
    @url = 'жраки.рф'
    mail(to: @user.email, subject: 'Welcome to жраки.рф')
  end
end
