class PurgatoriesController < ApplicationController
  def new
    if GithubService.new(current_user).purgatory?
      redirect_to user_path(current_user.nickname)
    end
  end

  def create
    GithubService.new(current_user).create_purgatory
    redirect_to user_path(current_user.nickname)
  end
end
