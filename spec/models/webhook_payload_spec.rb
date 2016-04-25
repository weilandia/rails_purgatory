require 'rails_helper'
RSpec.describe WebhookPayload, type: :model do
  include MockWebhookPayload
  it "asserts payload is from cli" do
    create(:user)
    payload = cli_submission_payload
    webhook_payload = WebhookPayload.new(payload)

    expect(webhook_payload.from_cli?).to eq(true)
  end

  it "refutes payload is from cli" do
    create(:user)
    payload = rails_purgatory_push_payload
    webhook_payload = WebhookPayload.new(payload)

    expect(webhook_payload.from_cli?).to eq(false)
  end

  it "creates commits" do
    create(:user)
    payload = cli_submission_payload
    webhook_payload = MockWebhookPayloadObject.new(payload)

    expect(webhook_payload.commit.class).to eq(WebhookCommit)
  end

  it "compares commits" do
    create(:user)
    payload = cli_submission_payload
    webhook_payload = MockWebhookPayloadObject.new(payload)
    comparison = webhook_payload.comparison.first

    expect(comparison.additions).to eq(3)
    expect(comparison.filename).to eq("app/purgatory_challenges/divinization.rb")
  end
end
