class ExerciseWorker < ActiveJob::Base
  queue_as :default

  def perform(service, exercise)
    service.add_exercise(exercise)
  end
end
