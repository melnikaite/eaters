class UserMailer < ActionMailer::Base
  default from: 'admin@eaters.org'

  def welcome_email(user, password)
    @user = user
    @password  = password
    @url = 'https://www.zhraki.org'
    mail(to: @user.email, subject: I18n.t('emails.welcome.subject'))
  end
end
