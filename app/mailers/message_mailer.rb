class MessageMailer < ApplicationMailer
  default to: 'bouillaux@hotmail.fr'
  require 'sendgrid-ruby'

  def contact_email_from_user(message)
    @message = message
    mail(from: @message.email, body: @message.body)
  end
end
