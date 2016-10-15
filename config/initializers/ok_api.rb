Odnoklassniki.configure do |c|
  c.application_key = Rails.application.secrets.omniauth["odnoklassniki"]["public_key"]
  c.client_id       = Rails.application.secrets.omniauth["odnoklassniki"]["key"]
  c.client_secret   = Rails.application.secrets.omniauth["odnoklassniki"]["secret"]
end
