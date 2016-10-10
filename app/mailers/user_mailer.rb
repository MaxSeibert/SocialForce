class UserMailer < ApplicationMailer

  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.user_mailer.signup_confirmation.subject
  #
  def signup_confirmation(user)
    @greeting = "Hi"
    @user = user
    #mail to: "impact@social-force.com", subject: "Sign Up Confirmation"
    mail to: "max-seibert@web.de", subject: "Sign Up Confirmation"
    
  end
end
