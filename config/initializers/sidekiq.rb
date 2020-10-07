redis_config = { url: ENV["SIDEKIQ_REDIS_URL"] || "redis://localhost:6379/0/cache" }

Sidekiq.configure_server do |config|
  config.redis = redis_config
end

Sidekiq.configure_client do |config|
  config.redis = redis_config
end
