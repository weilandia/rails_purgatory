module Api
  module V1
    class SubmissionsController < ApiController
      def create
        payload = WebhookPayload.new(params)
        if payload.from_cli?
          @submissions = SubmissionGenerator.new(payload).collect_submissions
          @submissions.each(&:save)
        end
        require "pry"; binding.pry
        render "api/v1/submissions/index"
      end
    end
  end
end
