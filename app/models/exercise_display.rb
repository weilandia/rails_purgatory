class ExerciseDisplay
  attr_reader :spec
  def initialize(exercise)
    @spec = CodeRay::Duo[:ruby, :div].highlight(exercise.spec)
  end
end
