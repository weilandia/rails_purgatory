require "rails_helper"

RSpec.describe "GET /search/repositories?q=+purgatoryuser:user.nickname+repo:purgatory+fork:only", type: :request do
  it "returns a boolean value after seraching for purgatory repo" do
    VCR.use_cassette("service.purgatory?") do
      user = create(:github_user)

      service = GithubService.new(user)
      response = service.purgatory?

      expect(response).to be_in([true, false])
    end
  end

  it "searches github for specific repo" do
    VCR.use_cassette("service.search_for_purgatory_repo") do
      user = create(:github_user)

      service = GithubService.new(user)
      response = service.search_for_purgatory_repo

      expect(response[:incomplete_results]).to be(false)
    end
  end
end
