get '/issues' do
  @issues = Issue.all
  "Issues: " + @issues.inspect
end
