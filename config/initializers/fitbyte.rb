FitbitAPI.configure do |config|
  config.client_id       = Rails.application.secrets.fitbit_api_client_id
  config.client_id       = Rails.application.secrets.fitbit_api_client_secret
  config.snake_case_keys = true
  config.symbolize_keys  = true
end
