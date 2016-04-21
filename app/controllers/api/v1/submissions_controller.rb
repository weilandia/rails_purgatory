module Api
  module V1
    class SubmissionsController < ApiController
      def create
        payload = WebhookPayload.new(params)
        if payload.from_cli?
          @submissions = SubmissionGenerator.new(payload).collect_submissions
          @submissions.each(&:save)
          render :nothing
        end
      end
    end
  end
end
