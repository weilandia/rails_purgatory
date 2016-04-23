class ExercisesController < ApplicationController
  def create
    exercise = Exercise.find_by(name: exercise_params[:exercise])
    user_exercise = current_user.user_exercises.new(exercise_id: exercise.id)

    if user_exercise.save
      GithubService.new(current_user).add_exercise(exercise)
    end
  end

  def show
    @exercise = Exercise.find(params[:id])
    @submissions = User.find_by(nickname: params[:username]).submissions
    require "pry"; binding.pry
  end

  private
  def exercise_params
    params.permit(:exercise)
  end
end
