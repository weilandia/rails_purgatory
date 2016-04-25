FactoryGirl.define do
  factory :user do
    provider "github"
    uid "12345"
    name "Test user"
    nickname "test"
    token "token"
    email "test@example.com"
    level 1
  end

  factory :github_user, parent: :user do
    token ENV['GITHUB_USER_TOKEN']
    nickname ENV['GITHUB_USER']
  end
end
