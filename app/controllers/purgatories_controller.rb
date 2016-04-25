class PurgatoriesController < ApplicationController
  def create
    service = GithubService.new(current_user)
    service.create_purgatory
    if service.purgatory?
      service.create_first_exercise
    end
    redirect_to user_path(current_user.nickname)
  end
end
