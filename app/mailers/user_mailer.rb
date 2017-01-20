class UserMailer < ApplicationMailer
  default from: 'leborges.g@gmail.com'

  def welcome_email(user)
    @user = user
    @url  = 'http://example.com/login'
    mail(to: @user, subject: 'Bienvenue biloutte')
  end

end
