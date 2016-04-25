require "rails_helper"

RSpec.describe "Submission creation", type: :request do
  include MockWebhookPayload
  it "identifies a hit from the app that isn't a user submission and renders nothing" do
    create(:user)
    post submission_path(User.first.nickname), rails_purgatory_push_payload

    expect(response.header["Content-Length"]). to eq("0")
    expect(response).to have_http_status(:success)
  end
end
