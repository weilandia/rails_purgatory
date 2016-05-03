class SubmissionsController < ApplicationController
  def index
    @exercises = Submission.completed(current_user).decorate
    require "pry"; binding.pry
  end
end
