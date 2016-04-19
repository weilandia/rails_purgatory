Rails.application.routes.draw do
  get 'purgatory/new'

  get 'purgatory/create'

  root 'static_pages#home'
  get '/auth/github', as: :github_login
  get '/auth/:provider/callback', to: 'sessions#create'
  get 'sessions/destroy', as: :signout

  resource :users, as: :user, path: ":username", only: [:show] do
    resources :purgatories, only: [:new, :create, :show]
  end
end
