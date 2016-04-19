class PurgatoriesController < ApplicationController
  def new
  end

  def create
    GithubService.new(current_user).create_purgatory
    redirect_to user_purgatory_path(current_user.nickname)
  end
end
