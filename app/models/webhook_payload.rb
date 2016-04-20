class WebhookPayload
  attr_reader :commit_message, :user
  def initialize(params)
    @commit_message = params[:commits].first[:message]
    @commit_sha = params[:after]
    @user = User.find_by(nickname: params[:username])
    @service = GithubService.new(@user)
  end

  def commit
    WebhookCommit.new(@commit_sha, @service)
  end

  def comparison
    commit.compare
  end

  def from_cli?
    @commit_message != "Welcome to purgatory."
  end
end
