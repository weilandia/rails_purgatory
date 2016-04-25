class MockWebhookPayloadObject < WebhookPayload
  attr_reader :commit_message, :user
  def initialize(params)
    @commits = params[:commits]
    @commit_sha = params[:after]
    @user = User.find_by(nickname: params[:username])
    @service = MockGithubService.new
    @commit_message = @commits.first[:message]
  end
end

module MockWebhookPayload
  def cli_submission_payload
    {
      "username": "test",
      "after": "9b87f6f880de24cfaad44f9703cf98557c4fe332",
      "commits": [
        {
          "message": "test",
          "author": {
            "name": "Nick Weiland",
            "email": "nickweiland@gmail.com",
            "username": "weilandia"
          },
          "committer": {
            "name": "Nick Weiland",
            "email": "nickweiland@gmail.com",
            "username": "weilandia"
          },
          "modified": [
            "app/purgatory_challenges/divinization.rb"
          ]
        }
      ],
      "repository": {
        "id": 56997947,
        "name": "purgatory",
        "full_name": "weilandia/purgatory",
        "owner": {
          "name": "weilandia",
          "email": "nickweiland@gmail.com"
        }
      }
    }
  end

  def rails_purgatory_push_payload
    {
      "username": "test",
      "after": "9b87f6f880de24cfaad44f9703cf98557c4fe332",
      "commits": [
        {
          "message": "Welcome to purgatory.",
          "author": {
            "name": "Nick Weiland",
            "email": "nickweiland@gmail.com",
            "username": "weilandia"
          },
          "committer": {
            "name": "Nick Weiland",
            "email": "nickweiland@gmail.com",
            "username": "weilandia"
          },
          "modified": [
            "app/purgatory_challenges/divinization.rb"
          ]
        }
      ],
      "repository": {
        "id": 56997947,
        "name": "purgatory",
        "full_name": "weilandia/purgatory",
        "owner": {
          "name": "weilandia",
          "email": "nickweiland@gmail.com"
        }
      }
    }
  end
end
