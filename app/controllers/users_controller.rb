class UsersController < ApplicationController
  def show
    @exercises = Exercise.all.decorate
  end
end
