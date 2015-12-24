ENV['RACK_ENV'] ||= 'test'

require 'bundler'
Bundler.require(:default, ENV['RACK_ENV'])

Dotenv.load

require_relative 'config/config'

class GithubIssuesLoaderApp < Sinatra::Application
  helpers do
    include Rack::Utils

    delegate :logger, to: :settings
  end
end

%w[models services workers/base workers processors/base processors routes].each do |dir|
  Dir["app/#{dir}/**/*.rb"].sort.map { |file| require_relative file }
end
