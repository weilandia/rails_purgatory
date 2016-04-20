class SubmissionGenerator
  def initialize(payload)
    @user = User.find(payload.user.id)
    @commit_message = payload.commit_message
    @comparison = payload.comparison
    @exercises = find_exercises(find_specs)
    @solutions = find_solutions
  end

  def find_specs
    @comparison.select do |file|
      file.filename.include?("spec")
    end
  end

  def find_exercises(specs)
    require "pry"; binding.pry
    specs.map do |spec|
      require "pry"; binding.pry
      Exercise.find_by(path: spec.filename)
    end
  end

  def collect_submissions
    require "pry"; binding.pry
    @exercises.map do |exercise|
      solution = select_exercise_solution(exercise).first
      user_exercise = @user.user_exercises.find(exercise.id)
      user_exercise.submissions.new(text: solution.contents, encoded_text: solution.encoded_contents)
    end
  end

  def select_exercise_solution(exercise)
    @comparison.select { |file| file.parse_solution_name == exercise.parse_name
    }
  end

  def find_solutions
    @comparison.select do |file|
      file.filename.include?("app/models/solutions")
    end
  end
end
