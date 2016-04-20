class WebhookCommit
  attr_reader :message
  def initialize(commit_sha, service)
    @service = service
    @sha = commit_sha
    @commit = @service.get_payload_commit(commit_sha)
    @files_changed = @commit[:files]
    @message = @commit[:commit][:message]
  end

  def compare
    @files_changed.map do |file|
      WebhookFileChange.new(file, @service, @sha)
    end
  end
end
