set :raise_errors, true
set :show_exceptions, false
set :app, :github_issues_loader_app
set :env, ENV['RACK_ENV']
set :protection, except: [:json_csrf]
set :root, File.expand_path(File.join(File.dirname(__FILE__), '../'))

logger = Logger.new(STDOUT)

enable :logging
set :logger, logger
use Rack::CommonLogger, logger

before do
  content_type :json
end

use Rack::Cors do |config|
  config.allow do
    origins '*'
    resource '*',
      headers: :any,
      methods: [:get, :post, :delete, :put, :patch, :options],
      max_age: 0
  end
end

require 'rack'
require 'rack/contrib'

use Rack::PostBodyContentTypeParser

require_relative 'initializers/db'
require_relative 'initializers/sidekiq'
