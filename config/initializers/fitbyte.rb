Fitbyte.configure do |config|
  config.client_id      = Rails.application.secrets.fitbyte_client_id
  config.client_id      = Rails.application.secrets.fitbyte_client_secret
  config.snake_case     = true
  config.symbolize_keys = true
end
