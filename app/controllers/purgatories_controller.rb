class PurgatoriesController < ApplicationController
  def create
    service = GithubService.new(current_user)
    service.create_purgatory
    service.create_first_exercise
    redirect_to user_path(current_user.nickname)
  end
end
