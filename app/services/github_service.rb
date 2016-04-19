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

  def put(path, params)
    params = params.to_json
    parse(connection.post(path, params))
  end

  def create_purgatory
    if !purgatory?
      parse(connection.post("/repos/railspurgatory/purgatory/forks"))
    end
  end

  def add_exercise(exercise)
    params = exercise_params(exercise)
    put(exercise.path, params)
  end

  def exercise_params(exercise)
    { path: exercise.path, content: exercise.encoded_text, message: exercise.commit_message }
  end

  def purgatory?
    parse(connection.put("/repos/#{@user.nickname}/purgatory/contents/spec/test.rb"))
    search_for_purgatory_repo[:total_count] >= 1
  end

  def search_for_purgatory_repo
    Rails.cache.fetch("#{@user.nickname}_purgatory", expires_in: 1.minute) do
      parse(connection.get("/search/repositories?q=+purgatoryuser:#{@user.nickname}+repo:purgatory+fork:only"))
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
