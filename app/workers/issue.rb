class IssueWorker
  include Sidekiq::Worker
  sidekiq_options queue: :default

  def perform
    # Load issues
  end
end
