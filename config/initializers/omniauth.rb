Rails.application.config.middleware.use OmniAuth::Builder do
  provider :steam, Settings[:steam_key]
end
