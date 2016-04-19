class GithubService

  def initialize(user)
    @user = user
    @_connection = Faraday.new("https://api.github.com")
    connection.headers = {"Authorization" => "token #{@user.token}", "Content-Type" => "application/json"}
  end

  def get(path, params=nil)
    parse(connection.get(path, params))
  end

  def post(path, params)
    params = params.to_json
    parse(connection.post(path, params))
  end

  def create_purgatory
    if new_to_purgatory?
    end
  end

  def new_to_purgatory?
    search_for_purgatory_repo[:incomplete_results]
  end

  def search_for_purgatory_repo
    Rails.cache.fetch("#{@user.nickname}_purgatory", expires_in: 1.minute) do
      parse(connection.get("/search/repositories?q=Rails Purgatory+in:readme+user:#{@user.nickname}"))
    end
  end

private
  def parse(response)
    JSON.parse(response.body, symbolize_names: true)
  end

  def connection
    @_connection
  end
end
