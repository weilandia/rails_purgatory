class ExercisesController < ApplicationController
  def create
    require "pry"; binding.pry
    exercise = Exercise.find_by(name: exercise_params[:exercise])
    user_exercise = current_user.user_exercises.new(exercise_id: exercise.id)

    if user_exercise.save
      GithubService.new(current_user).add_exercise(exercise)
    end
  end

  private
  def exercise_params
    params.permit(:exercise)
  end
end
