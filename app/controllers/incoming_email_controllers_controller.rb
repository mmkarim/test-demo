# frozen_string_literal: true

class IncomingEmailControllersController < ApplicationController

  # TODO: Should consider Action Mailbox

  def create
    @email = Email.new(email_params.merge(default_email_params))

    if @email.save
      render :show, status: :created, location: @email

    else
      render json: @email.errors, status: :unprocessable_entity
    end
  end

  def email_params
    params.require(:email).permit(:subject, :from, :to, :message_body)
  end

  def default_email_params
    { direction: Email.directions[:in] }
  end
end
