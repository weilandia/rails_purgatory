class SubmissionGenerator
  def initialize(payload)
    @user = User.find(payload.user.id)
    @comparison = payload.comparison
    @submissions = find_submissions
  end

  def find_submissions
    @comparison.select do |file|
      file.filename.include?("app/purgatory_challenges/") && !file.filename.include?("spec")
    end
  end

  def collect_submissions
    @submissions.map do |submission|
      exercise = Exercise.find_by(solution_frame_path: submission.filename)
      user_exercise = @user.user_exercises.find_by(exercise_id: exercise.id)
      user_exercise.update(submission: 1)
      @user.level_up
      user_exercise.submissions.new(solution: submission.contents, encoded_solution: submission.encoded_contents)
    end
  end
end
