module Api
  module V1
    class SubmissionsController < ApiController
      def create
        payload = WebhookPayload.new(params)
        if payload.from_cli?
          SubmissionGenerator.new(payload).collect_submissions
        end
        render nothing: true
      end
    end
  end
end
