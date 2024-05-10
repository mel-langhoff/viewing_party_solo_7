Rails.application.routes.draw do
  root "welcome#index"
  get '/register', to: 'users#new', as: 'register_user'

  resources :users, only: [:show, :create] do
    resources :discover, only: [:index]
    resources :movies, only: [:index, :show]
    resources :viewing_parties, only: [:new]
  end
end
# /users/:user_id/movies/:movie_id/viewing_party/new