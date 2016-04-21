Rails.application.routes.draw do
  root 'static_pages#home'
  get '/auth/github', as: :github_login
  get '/auth/:provider/callback', to: 'sessions#create'
  get 'sessions/destroy', as: :signout

  post '/api/v1/:username/submissions', to: 'api/v1/submissions#create', as: :submission

  resource :users, as: :user, path: ":username", only: [:show] do
    resource :purgatory, only: [:new, :create, :show]
    resources :exercises, only: [:create]
  end
end
