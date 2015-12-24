get '/robots.txt' do
  "User-agent: *\nDisallow: /\n"
end

not_found do
  status 404
  { errors: ['Nothing to do here. See documentation.'] }.to_json
end