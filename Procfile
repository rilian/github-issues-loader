web: bundle exec puma -e $RACK_ENV -C config/puma.rb

worker: bundle exec sidekiq -e $RACK_ENV -q high,5 -q default,3 -q low,1 -r ./app.rb -L log/sidekiq.log
