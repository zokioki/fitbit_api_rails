FitbitAPI.configure do |config|
  config.client_id       = ENV.fetch("FITBIT_API_CLIENT_ID")
  config.client_secret   = ENV.fetch("FITBIT_API_CLIENT_SECRET")
  config.snake_case_keys = true
  config.symbolize_keys  = true
end
