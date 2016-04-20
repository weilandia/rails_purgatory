Rails.application.routes.draw do
  get 'submissions/create'

  get 'exercises/create'

  root 'static_pages#home'
  get '/auth/github', as: :github_login
  get '/auth/:provider/callback', to: 'sessions#create'
  get 'sessions/destroy', as: :signout

  resource :users, as: :user, path: ":username", only: [:show] do
    resource :purgatory, only: [:new, :create, :show]
    resources :exercises, only: [:create]
    resources :submissions, only: [:create]
  end
end
