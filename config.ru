require_relative 'app'
require 'sidekiq/web'

Sidekiq::Web.use Rack::Auth::Basic do |username, password|
  username == ENV['SIDEKIQ_USERNAME'] && password == ENV['SIDEKIQ_PASSWORD']
end

run Rack::URLMap.new('/' => GithubIssuesLoaderApp.new, '/sidekiq' => Sidekiq::Web)
