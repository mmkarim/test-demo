# frozen_string_literal: true

class DemoMailer < ApplicationMailer
  def default_email(to:, subject:, message_body:)
    @message_body = message_body
    mail(to: to, subject: subject)
  end
end
