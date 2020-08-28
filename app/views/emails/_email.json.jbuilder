json.extract! email, :id, :subject, :to, :from, :message_body, :direction, :created_at, :updated_at
json.url email_url(email, format: :json)
