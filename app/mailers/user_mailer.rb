class UserMailer < ApplicationMailer
  default from: 'leborges.g@gmail.com'

  def welcome_email(user)
    @user = user
    @url  = 'http://example.com/login'
    mail(to: @user, subject: 'Bienvenue biloutte')
  end

  def admin_mailer(admin, password, name)
    @mail = admin
    @tmp_password = password
    @name = name
    mail(to: @mail, subject: 'Bienvenue en tant qu administrateur')
  end

end
