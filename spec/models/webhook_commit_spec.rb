require 'rails_helper'

RSpec.describe WebhookCommit, type: :model do
  it "compares files changed" do
    service = MockGithubService.new
    sha = "9b87f6f880de24cfaad44f9703cf98557c4fe332"
    webhook_commit = WebhookCommit.new(sha, service)
    files_changed = webhook_commit.compare
    expect(files_changed.first.class).to eq(WebhookFileChange)
  end
end
