class UserMailer < ActionMailer::Base
  default from: "noreply@qr5.in"

  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.user_mailer.password_reset.subject
  #
  def password_reset(user)
    @user = user
    mail to: user.email, subject: "Password Reset"
  end

  def account_confirmation(user)
    @user = user
    mail to: @user.email, subject: "Welcome to QR5.IN!"
  end
end
