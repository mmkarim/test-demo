# frozen_string_literal: true

class EmailsController < ApplicationController
  before_action :set_email, only: [:show]

  # GET /emails
  # GET /emails.json
  def index
    #TODO: add proper indexes in the DB
    @emails = Email.where(direction: direction).order(created_at: :desc)
  end

  # GET /emails/1
  # GET /emails/1.json
  def show
  end

  # GET /emails/new
  def new
    @email = Email.new
  end

  # POST /emails
  # POST /emails.json
  def create
    @email = Email.new(email_params.merge(default_email_params))

    respond_to do |format|
      if @email.save
        DemoMailer.default_email(**email_params.to_h.symbolize_keys).deliver_later

        format.html { redirect_to @email, notice: 'Email was successfully created.' }
        format.json { render :show, status: :created, location: @email }
      else
        format.html { render :new }
        format.json { render json: @email.errors, status: :unprocessable_entity }
      end
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_email
      @email = Email.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def email_params
      params.require(:email).permit(:subject, :to, :message_body)
    end

    def default_email_params
      { direction: Email.directions[:out], from: Settings[:email][:default_from] }
    end

    def direction
      params[:direction] || Email.directions[:in]
    end
end
