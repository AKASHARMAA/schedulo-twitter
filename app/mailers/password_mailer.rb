class PasswordMailer < ApplicationMailer

  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.password_mailer.reset.subject
  #
  def reset
    # this not request param this is what we sent from the controller
    # @token is an instance variable that will be passed to the email templates
    @token = params[:user].signed_id(purpose: "password_reset", expires_in: 15.minutes)

    mail to: params[:user].email
  end

  
end
