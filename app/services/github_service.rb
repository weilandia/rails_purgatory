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
    parse(connection.put(path, params))
  end

  def get_payload_commit(sha)
    get("/repos/#{@user.nickname}/purgatory/commits/#{sha}")
  end

  def get_file_contents(filename, sha)
    get("/repos/#{@user.nickname}/purgatory/contents/#{filename}", { ref: sha })
  end

  def create_purgatory
    if !purgatory?
      parse(connection.post("/repos/railspurgatory/purgatory/forks"))
      post("/repos/#{@user.nickname}/purgatory/hooks", web_hook_params)
    end
  end

  def web_hook_params
    { name: "web",
      config: {
        url: "http://2851207a.ngrok.io" + "/api/v1/#{@user.nickname}/submissions",
        content_type: "json"
        }
      }
  end

  def add_exercise(exercise)
    add_test(exercise)
    add_solution_frame(exercise)
  end

  def add_test(exercise)
    spec_params = exercise_params(exercise)
    put("repos/#{@user.nickname}/purgatory/contents/#{exercise.spec_path}", spec_params)
  end

  def add_solution_frame(exercise)
    solution_params = exercise_solution_params(exercise)
    put("repos/#{@user.nickname}/purgatory/contents/#{exercise.solution_frame_path}", solution_params)
  end

  def exercise_params(exercise)
    { path: exercise.spec_path, content: exercise.encoded_spec, message: "Welcome to purgatory." }
  end

  def exercise_solution_params(exercise)
    { path: exercise.solution_frame_path, content: exercise.encoded_solution_frame, message: "Welcome to purgatory." }
  end

  def purgatory?
    search_for_purgatory_repo[:total_count] >= 1
  end

  def search_for_purgatory_repo
    Rails.cache.fetch("#{@user.nickname}_purgatory", expires_in: 1.minute) do
      parse(connection.get("/search/repositories?q=+purgatoryuser:#{@user.nickname}+repo:purgatory+fork:only"))
    end
  end

  def delete_purgatory
    parse(connection.delete("/repos/#{@user.nickname}/purgatory"))
  end

private
  def parse(response)
    JSON.parse(response.body, symbolize_names: true)
  end

  def connection
    @_connection
  end
end
