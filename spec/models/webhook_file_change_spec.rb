require 'rails_helper'

RSpec.describe WebhookCommit, type: :model do
  before(:each) do
    service = MockGithubService.new
    sha = "9b87f6f880de24cfaad44f9703cf98557c4fe332"
    webhook_commit = WebhookCommit.new(sha, service)
    files_changed = webhook_commit.compare
    @webhook_file_change = files_changed.first
  end

  it "retrieves filename" do
    expect(@webhook_file_change.filename).to eq("app/purgatory_challenges/divinization.rb")
  end

  it "retrieves encoded contents" do
    expect(@webhook_file_change.encoded_contents).to eq("cmVxdWlyZSAnYWN0aXZlX3N1cHBvcnQvY29uY2VybicKbW9kdWxlIERpdmlu\naXphdGlvbgogIExFVkVMID0gMQogIGV4dGVuZCBBY3RpdmVTdXBwb3J0OjpD\nb25jZXJuCgogIGRlZiB1bmlxdWVfbWVyY2hhbnRfaWRzCiAgICAidGVzdCIK\nICBlbmQKCiAgY2xhc3NfbWV0aG9kcyBkbwogICAgZGVmIHBsdWNrX2ZpcnN0\nX25hbWVzCiAgICAgICJ0ZXN0IgogICAgZW5kCgogICAgZGVmIHBsdWNrX2xh\nc3RfbmFtZXNfaW5fcmV2ZXJzZV9hbHBoYWJldGljYWxfb3JkZXIKICAgICAg\nInRlc3QiCiAgICBlbmQKICBlbmQKZW5kCg==\n")
  end

  it "decodes encoded contents" do
    expect(@webhook_file_change.contents).to eq("require 'active_support/concern'\nmodule Divinization\n  LEVEL = 1\n  extend ActiveSupport::Concern\n\n  def unique_merchant_ids\n    \"test\"\n  end\n\n  class_methods do\n    def pluck_first_names\n      \"test\"\n    end\n\n    def pluck_last_names_in_reverse_alphabetical_order\n      \"test\"\n    end\n  end\nend\n")
  end

  it "retrieves commit addition count" do
    expect(@webhook_file_change.additions).to eq(3)
  end

  it "parses solution name" do
    expect(@webhook_file_change.parse_solution_name).to eq("divinization")
  end
end
