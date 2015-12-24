Sidekiq.default_worker_options = { backtrace: true }

Sidekiq.configure_server do |config|
  config.options[:concurrency] = ENV['SIDEKIQ_CONCURRENCY'].to_i
  config.redis = { url: ENV['SIDEKIQ_SERVER_REDIS_URL'] }
end

Sidekiq.configure_client do |config|
  config.redis = { url: ENV['SIDEKIQ_SERVER_REDIS_URL'] }
end
