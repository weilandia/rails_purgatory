require 'rails_helper'

RSpec.describe "guest permissions" do
  @user = User.new

  scenario "sessions#create" do
    permission = Permission.new(@user, 'sessions', 'create')
    result = permission.allow?
    expect(result).to be true
  end

  scenario "static_pages#home" do
    permission = Permission.new(@user, 'static_pages', 'home')
    result = permission.allow?
    expect(result).to be true
  end

  scenario "api/v1/submissions#create" do
    permission = Permission.new(@user, 'api/v1/submissions', 'create')
    result = permission.allow?
    expect(result).to be true
  end

  #not permitted
  scenario "users#show" do
    permission = Permission.new(@user, 'users', 'show')
    result = permission.allow?
    expect(result).to be_falsey
  end

  scenario "comments#create" do
    permission = Permission.new(@user, 'comments', 'create')
    result = permission.allow?
    expect(result).to be_falsey
  end

  scenario "exercises#create" do
    permission = Permission.new(@user, 'exercises', 'create')
    result = permission.allow?
    expect(result).to be_falsey
  end

  scenario "exercises#show" do
    permission = Permission.new(@user, 'exercises', 'show')
    result = permission.allow?
    expect(result).to be_falsey
  end

  scenario "purgatories#create" do
    permission = Permission.new(@user, 'purgatories', 'create')
    result = permission.allow?
    expect(result).to be_falsey
  end

  scenario "sessions#destroy" do
    permission = Permission.new(@user, 'sessions', 'destroy')
    result = permission.allow?
    expect(result).to be_falsey
  end
end
