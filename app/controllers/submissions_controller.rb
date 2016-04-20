class SubmissionsController < ApplicationController
  protect_from_forgery with: :null_session

  def create
    #identify exercise via "ITERATION: delta"
    #Via exercise w/ git diff, identify model and method
    #Parse solution into html
    #Create
    payload = WebhookPayload.new(params)
    if payload.from_cli?
      submissions = SubmissionGenerator.new(payload)
      submissions.collect_submissions
      if submissions.each(&:save)
        require "pry"; binding.pry
      end
    end
  end
end
