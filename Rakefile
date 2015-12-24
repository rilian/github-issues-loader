namespace :bundler do
  task :setup do
    require 'rubygems'
    require 'bundler/setup'
  end
end

task :environment, [:env] => 'bundler:setup' do |cmd, args|
  ENV["RACK_ENV"] = args[:env] || "development"
  require "./app.rb"
end

namespace :db do
  desc "Migrate the database"
  task(:migrate => :environment) do
    ActiveRecord::Base.logger = Logger.new(STDOUT)
    ActiveRecord::Migration.verbose = true
    ActiveRecord::Migrator.migrate("db/migrate")
  end
end