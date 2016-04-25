require 'rails_helper'
RSpec.describe SubmissionGenerator, type: :model do
  include MockWebhookPayload
  before(:each) do
    create(:user)
    payload = cli_submission_payload
    @webhook_payload = MockWebhookPayloadObject.new(payload)
  end

  it "initializes with correct attributes" do
    generator = SubmissionGenerator.new(@webhook_payload)

    expect(generator.instance_values["user"].class).to eq(User)

    expect(generator.instance_values["comparison"].first.class).to eq(WebhookFileChange)

    expect(generator.instance_values["submissions"].first.class).to eq(WebhookFileChange)
  end

  it "finds submissions" do
    generator = SubmissionGenerator.new(@webhook_payload)

    expect(generator.find_submissions.class).to eq(Array)
    expect(generator.find_submissions.first.filename).to eq("app/purgatory_challenges/divinization.rb")
  end

  it "collects and instantiates submissions" do
    create(:exercise_divinization)
    generator = SubmissionGenerator.new(@webhook_payload)
    user_exercise = User.first.user_exercises.create(exercise_id: 1)
    expect(generator.collect_submissions.class).to eq(Array)
    expect(generator.collect_submissions.first.class).to eq(Submission)
    expect(generator.collect_submissions.first.user_exercise).to eq(user_exercise)
  end
end
