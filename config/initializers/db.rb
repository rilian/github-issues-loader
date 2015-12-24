require 'active_record'

db_settings = {
  'adapter' => 'postgresql',
  'encoding' => 'unicode',
  'host' => (ENV['POSTGRES_DB_HOST'] || 'localhost'),
  'port' => (ENV['POSTGRES_DB_PORT'] || 5432),
  'pool' => (ENV['POSTGRES_DB_POOL_SIZE'] || 10),
  'username' => ENV['POSTGRES_DB_USERNAME'],
  'password' => ENV['POSTGRES_DB_PASSWORD'],
  'database' => ENV['DB_DATABASE']
}

ActiveRecord::Base.establish_connection(db_settings)
