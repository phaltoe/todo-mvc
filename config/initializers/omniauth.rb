Rails.application.config.middleware.use OmniAuth::Builder do
  provider :github, '28be370ba9b47426b6ba', 'cc8d748d3f077142bd2c3f774f7c40e28f3f5c75'
end